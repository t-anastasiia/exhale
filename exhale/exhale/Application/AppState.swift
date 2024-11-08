//
//  AppState.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-10-23.
//

import Foundation
import Combine

class AppState: ObservableObject {
    @Published var currentUser: User = User()
    @Published var soundsState = SoundsAppState()
}
