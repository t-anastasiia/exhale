//
//  CustomButton.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-10-23.
//

import SwiftUI

struct CustomButton: View {
    
    let title: String
    let verticalPadding: CGFloat
    
    var body: some View {
        Text(title)
        .foregroundStyle(Color("text_dark"))
        .frame(maxWidth: .infinity)
        .padding(.vertical, verticalPadding)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("AccentColor"))
        )
    }
}

#Preview {
    CustomButton(title: "Вход",
                 verticalPadding: 26)
}
