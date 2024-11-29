//
//  SoundsIdentifierViewModel.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-11-08.
//

import Foundation
import Combine
import SoundAnalysis

class SoundsIdentifierViewModel: ObservableObject {
    private var appConfig: SoundsConfiguration
    private var systemAudioClassifier: SystemAudioClassifier

    init(config: SoundsConfiguration = SoundsConfiguration(), classifier: SystemAudioClassifier = SystemAudioClassifier.singleton) {
        self.appConfig = config
        self.systemAudioClassifier = classifier
    }
    
    func restartDetection(soundsState: SoundsAppState) {
        stopDetection()
        soundsState.detectionTime = []
        soundsState.intervals = []
        
        let classificationSubject = PassthroughSubject<SNClassificationResult, Error>()
        
        soundsState.cancellable = classificationSubject
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in
                    soundsState.soundDetectionIsRunning = false
                },
                receiveValue: { [weak self] value in
                    guard let self = self else { return }
                    if self.isDetected(value: value, state: soundsState) {
                        let currentTime = Date()
                        soundsState.detectionTime.append(currentTime)
                        let count = soundsState.detectionTime.count
                        
                        if count > 1 {
                            let description = count % 2 == 0 ? "inhale -> exhale" : "exhale -> inhale"
                            let detected = soundsState.detectionTime[count - 1]
                            soundsState.intervals.append(
                                Breath(
                                    id: Int(detected.id),
                                    description: description,
                                    interval: soundsState.detectionTime[count - 2].distance(to: detected),
                                    time: soundsState.detectionTime[0].distance(to: detected)
                                )
                            )
                        }
                    }
                }
            )
        
        soundsState.soundDetectionIsRunning = true
        systemAudioClassifier.startSoundClassification(
            subject: classificationSubject,
            inferenceWindowSize: appConfig.inferenceWindowSize,
            overlapFactor: appConfig.overlapFactor
        )
    }
    
    func stopDetection() {
        systemAudioClassifier.stopSoundClassification()
    }
    
    private func isDetected(value: SNClassificationResult, state: SoundsAppState) -> Bool {
        (value.classification(forIdentifier: appConfig.monitoredSounds.labelName)?.confidence ?? 0) >= 0.7
    }
}
