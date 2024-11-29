//
//  Date + Ex.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-11-08.
//

import Foundation

extension Date: @retroactive Identifiable {
    public var id: Double {
        self.timeIntervalSince1970
    }
}
