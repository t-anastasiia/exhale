//
//  TimeInterval+Ex.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-11-30.
//

import Foundation

extension TimeInterval {
    func stringFromTimeInterval() -> String {
        let time = NSInteger(self)
        let ms = Int((self.truncatingRemainder(dividingBy: 1)) * 1000)
        let seconds = time % 60
        let minutes = (time / 60) % 60
        return String(format: "%0.2d:%0.2d.%0.3d", minutes, seconds, ms)
    }
}
