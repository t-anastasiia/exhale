//
//  SoundsAppState.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-11-08.
//

import Foundation
import Combine

class SoundsAppState: ObservableObject {
    @Published var config = SoundsConfiguration()
    @Published var detectionTime: [Date] = []
    @Published var intervals: [Breath] = []
    @Published var soundDetectionIsRunning: Bool = false
    var cancellable: AnyCancellable?
}
