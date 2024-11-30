//
//  SoundsIdentifierViewModel.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-11-08.
//

import Combine
import SoundAnalysis

class SoundDetectionViewModel: ObservableObject {
    private var appConfig = SoundsConfiguration()
    private var systemAudioClassifier: SystemAudioClassifier
    private var detectionCancellable: AnyCancellable? = nil
    
    @Published var soundDetectionIsRunning: Bool = false
    @Published var confidenceScale: CGFloat = 1.0
    @Published var lineScales: [Double] = Array(repeating: 1.0, count: 60)
    @Published var currentIndex = 0
    @Published var showStopSheet: Bool = false
    
    @Published var detectionTime: [Date] = []
    @Published var intervals: [Breath] = []
    @Published var currentBreath: String = "Ожидание"
    
    private var previousConfidence: Double = 1.0
    private var isRising: Bool = false
    var totalDuration: TimeInterval {
        intervals.reduce(0) { $0 + $1.interval }
    }
    var breathCount: Int {
        intervals.count
    }

    init(config: SoundsConfiguration = SoundsConfiguration(),
         classifier: SystemAudioClassifier = SystemAudioClassifier.singleton) {
        self.appConfig = config
        self.systemAudioClassifier = classifier
    }


    func startDetection() {
        stopDetection()
        detectionTime = []
        intervals = []
        currentBreath = "Начинайте"

        let classificationSubject = PassthroughSubject<SNClassificationResult, Error>()
        detectionCancellable = classificationSubject
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                self.soundDetectionIsRunning = false
            }, receiveValue: { value in
                let confidence = value.classification(forIdentifier: self.appConfig.monitoredSounds.labelName)?.confidence ?? 0
                self.updateNextLineScale(confidence: confidence)
                self.detectBreathChange(confidence: confidence)
            })

        soundDetectionIsRunning = true
        systemAudioClassifier.startSoundClassification(
            subject: classificationSubject,
            inferenceWindowSize: appConfig.inferenceWindowSize,
            overlapFactor: appConfig.overlapFactor
        )
    }
    
    private func detectBreathChange(confidence: Double) {
        print("Detection: Confidence = \(confidence)")
        print("Current Index Before: \(breathCount)")

        currentIndex = (currentIndex + 1) % lineScales.count

        if confidence > previousConfidence && !isRising {
            isRising = true

            let isInhale = (breathCount % 2 != 0)
            addBreath(isInhale: isInhale)
            
            print("Minimal point detected. BreathCount: \(breathCount), IsInhale: \(isInhale ? "Вдох" : "Выдох")")
        } else if confidence < previousConfidence {
            isRising = false
        }

        previousConfidence = confidence
    }

    func addBreath(isInhale: Bool) {
        let currentTime = Date()
        detectionTime.append(currentTime)

        if detectionTime.count > 1 {
            let description = isInhale ? "Вдох" : "Выдох"
            let interval = detectionTime[detectionTime.count - 2].distance(to: currentTime)
            intervals.append(Breath(
                id: breathCount,
                description: description,
                interval: interval,
                time: detectionTime.first?.distance(to: currentTime) ?? 0
            ))
            currentBreath = description
            print("Breath detected: \(description), Interval: \(interval), Total time: \(detectionTime.first?.distance(to: currentTime) ?? 0)")
        }
    }

    func stopDetection() {
        systemAudioClassifier.stopSoundClassification()
        showStopSheet = false
        soundDetectionIsRunning = false
    }

    private func updateNextLineScale(confidence: Double) {
        DispatchQueue.main.async {
            self.lineScales[self.currentIndex] = max(0.5, min(confidence * 2, 2.0))
            self.currentIndex = (self.currentIndex + 1) % self.lineScales.count
        }
    }
    
    func stopStartButton() {
        if soundDetectionIsRunning {
            self.showStopSheet = true
        } else {
            startDetection()
        }
    }
}
