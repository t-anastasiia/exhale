//
//  User.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-10-25.
//

import Foundation

public struct User {
    public let login: String
    public let email: String
    public let trainerEmail: String?
    
    init(login: String, email: String, trainerEmail: String?) {
        self.login = login
        self.email = email
        self.trainerEmail = trainerEmail
    }
    
    //MARK: mock user
    init() {
        self.login = "nastya"
        self.email = "nastaytalmazan@gmail.com"
        self.trainerEmail = nil
    }
}
