//
//  LoginView.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-10-23.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel = AuthViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 25) {
                Spacer()
                
                Text("Доброе пожаловать!")
                    .foregroundStyle(Color("text_light"))
                
                NavigationLink {
                    withAnimation {
                        EmailLoginView()
                            .environmentObject(viewModel)
                    }
                } label: {
                    CustomButton(title: "Вход",
                                 verticalPadding: 26)
                }

                NavigationLink {
                    withAnimation {
                        SignupView()
                            .environmentObject(viewModel)
                    }
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
