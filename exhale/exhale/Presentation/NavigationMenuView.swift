//
//  NavigationMenuView.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-10-25.
//

import SwiftUI

struct NavigationMenuView: View {
    
    @ObservedObject var viewModel = AuthViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            profileNavView
            
            VStack(spacing: 25) {
                
                Spacer()
                
                NavigationLink {
                    GuidedPracticeView()
                } label: {
                    CustomButton(title: "Начать тренировку дыхания",
                                 verticalPadding: 30)
                }
                
                Spacer()
                
            }
            .padding(.horizontal, 46)
            .background(BackgoundGradientView())
        }
    }
}

extension NavigationMenuView {
    var profileNavView: some View {
        HStack(spacing: 15) {
            AvatarVIew(size: 40)
            VStack(spacing: 0) {
                HStack {
                    Text("You")
                        .foregroundStyle(.textLight)
                    Spacer()
                }
                HStack {
                    Text(viewModel.session.session?.email ?? "error")
                        .font(.system(size: 12, weight: .light))
                        .foregroundStyle(.textLight)
                    Spacer()
                }
            }
            Spacer()
            Button {
                withAnimation {
                    viewModel.signOut()
                }
            } label: {
                Image(systemName: "rectangle.portrait.and.arrow.forward")
                    .foregroundStyle(.bgColorDark)
                    .font(.system(size: 30, weight: .medium))
            }
        }
        .padding(EdgeInsets(top: 16,
                            leading: 15,
                            bottom: 16,
                            trailing: 15))
        .background(.bgColorLight)
    }
}

#Preview {
    NavigationMenuView()
}
