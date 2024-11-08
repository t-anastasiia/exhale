//
//  SystemAudioClassificationError.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-11-08.
//

import Foundation

enum SystemAudioClassificationError: Error {
    case audioStreamInterrupted
    case noMicrophoneAccess
}
