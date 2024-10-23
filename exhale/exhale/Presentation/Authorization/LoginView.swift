//
//  LoginView.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-10-23.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 25) {
                Spacer()
                
                Text("Доброе пожаловать!")
                    .foregroundStyle(Color("text_light"))
                
                NavigationLink {
                    EmailLoginView()
                } label: {
                    CustomButton(title: "Вход",
                                 verticalPadding: 26)
                }

                NavigationLink {
                    SignupView()
                } label: {
                    CustomButton(title: "Создать аккаунт",
                                 verticalPadding: 26)
                }
                
                Spacer()
            }
            .padding(.horizontal, 46)
            .background(BackgoundGradientView())
        }
    }
}

#Preview {
    LoginView()
}
