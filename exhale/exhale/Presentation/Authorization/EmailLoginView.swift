//
//  EmailLoginView.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-10-23.
//

import SwiftUI
import PhotosUI

struct EmailLoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 25) {
            Spacer()
            
            topView
            EmailTextField(email: $email)
            PasswordTextField(password: $password)
            
            Button {
                //
            } label: {
                CustomButton(title: "Войти",
                             verticalPadding: 12)
            }
            .padding(.horizontal, 69)

            
            Spacer()
        }
        .padding(.horizontal, 46)
        .background(BackgoundGradientView())
    }
}

extension EmailLoginView {
    var topView: some View {
        VStack(spacing: 10) {
            Text("Вход")
                .foregroundStyle(Color("text_light"))
                .font(.system(size: 32))
            
            Button {
                print("avatar")
            } label: {
                AvatarVIew()
            }
        }
    }
}

#Preview {
    EmailLoginView()
}
