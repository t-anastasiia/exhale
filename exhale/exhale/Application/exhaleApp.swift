//
//  exhaleApp.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-10-23.
//

import SwiftUI

@main
struct exhaleApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
