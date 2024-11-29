//
//  AuthViewModel.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-11-29.
//

import Foundation
import SwiftUI

class AuthViewModel: ObservableObject {
    
    @Published var session = SessionStore.shared
    
    //MARK: properties for views
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var repeatPassword: String = ""
    @Published var error: String = ""
    @Published var showError: Bool = false
    
    func getUser() {
        session.listen()
    }
    
    func signIn() {
        
        session.signIn(email: self.email, password: self.password) { (result, error) in
            if let error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            }
        }
        
    }
    
    func signUp() {
        if password == repeatPassword {
            session.signUp(email: self.email, password: self.password) { (result, error) in
                if let error {
                    self.error = error.localizedDescription
                } else {
                    self.email = ""
                    self.password = ""
                }
            }
        } else {
            self.error = "Passwords don't match"
        }
    }
    
    func signOut() {
        session.signOut()
    }
    
    func presentError() {
        withAnimation {
            self.showError = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            withAnimation {
                self.showError = false
            }
        }
    }
}
