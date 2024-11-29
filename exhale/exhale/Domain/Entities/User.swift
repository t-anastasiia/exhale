//
//  User.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-10-25.
//

import Foundation

public struct User {
    public let uid: String
    public let email: String?
    
    init(uid: String, email: String?) {
        self.uid = uid
        self.email = email
    }
    
//    //MARK: mock user
//    init() {
//        self.uid = "1"
//        self.email = "nastaytalmazan@gmail.com"
//    }
}
