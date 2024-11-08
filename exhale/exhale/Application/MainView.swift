//
//  ContentView.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-10-23.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var state: AppState
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
