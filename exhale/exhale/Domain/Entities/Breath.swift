//
//  Breath.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-11-08.
//

import Foundation


import Foundation

struct Breath {
    let id: Int
    let description: String
    let interval: TimeInterval
    let time: TimeInterval
    
    func formattedInterval() -> String {
        return interval.stringFromTimeInterval()
    }
    
    func formattedTime() -> String {
        return time.stringFromTimeInterval()
    }
}
