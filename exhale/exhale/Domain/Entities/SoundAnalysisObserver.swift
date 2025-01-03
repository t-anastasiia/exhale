//
//  SoundAnalysisObserver.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-11-08.
//

import Foundation
import SoundAnalysis
import Combine

class ClassificationResultsSubject: NSObject, SNResultsObserving {
    private let subject: PassthroughSubject<SNClassificationResult, Error>

    init(subject: PassthroughSubject<SNClassificationResult, Error>) {
        self.subject = subject
    }

    func request(_ request: SNRequest,
                 didFailWithError error: Error) {
        subject.send(completion: .failure(error))
    }

    func requestDidComplete(_ request: SNRequest) {
        subject.send(completion: .finished)
    }

    func request(_ request: SNRequest,
                 didProduce result: SNResult) {
        if let result = result as? SNClassificationResult {
            subject.send(result)
        }
    }
}
