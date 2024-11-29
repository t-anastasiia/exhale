//
//  ContentView.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-10-23.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var session = SessionStore.shared
    
    var body: some View {
        Group {
            if session.session != nil {
                NavigationMenuView()
            } else {
                LoginView()
            }
        }
        .onAppear(perform: session.listen)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
