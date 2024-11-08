//
//  exhaleApp.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-10-23.
//

import SwiftUI

@main
struct exhaleApp: App {
    
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            MainView(state: appState)
        }
    }
}
