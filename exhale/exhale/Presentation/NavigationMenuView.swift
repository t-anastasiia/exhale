//
//  NavigationMenuView.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-10-25.
//

import SwiftUI

struct NavigationMenuView: View {
    var body: some View {
        VStack(spacing: 0) {
            profileNavView
            
            VStack(spacing: 25) {
                Spacer()
                Button {
                    
                } label: {
                    CustomButton(title: "Начать тренировку дыхания",
                                 verticalPadding: 30)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    CustomButton(title: "Настройки",
                                 verticalPadding: 22)
                }
                Button {
                    
                } label: {
                    CustomButton(title: "Связаться с тренером",
                                 verticalPadding: 22)
                }
                .padding(.bottom, 45)
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
                    Text("username")
                        .foregroundStyle(.textLight)
                    Spacer()
                }
                HStack {
                    Text("username@gmail.com")
                        .foregroundStyle(.textLight)
                    Spacer()
                }
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
