//
//  SoundsConfiguration.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-11-08.
//

import Foundation

struct SoundsConfiguration {
    let inferenceWindowSize = Double(1.2)
    
    var overlapFactor = Double(0.1)
    var monitoredSounds: SoundIdentifier = SoundIdentifier(labelName: "breathing")
}
