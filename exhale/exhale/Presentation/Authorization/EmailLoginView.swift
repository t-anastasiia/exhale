//
//  EmailLoginView.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-10-23.
//

import SwiftUI
import PhotosUI

struct EmailLoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 25) {
                Spacer()
                
                topView
                EmailTextField(email: $viewModel.email)
                PasswordTextField(password: $viewModel.password )
                
                Button {
                    viewModel.signIn()
                } label: {
                    CustomButton(title: "Войти",
                                 verticalPadding: 12)
                }
                .padding(.horizontal, 69)

                
                Spacer()
            }
            
            if viewModel.showError {
                VStack {
                    ErrorWindowView(text: viewModel.error)
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 46)
        .background(BackgoundGradientView())
        .onChange(of: viewModel.error) {
            viewModel.presentError()
        }
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
        .environmentObject(AuthViewModel())
}
