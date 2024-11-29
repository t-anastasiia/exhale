//
//  ErrorWindowView.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-11-29.
//

import SwiftUI

struct ErrorWindowView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundStyle(Color(uiColor: .systemRed))
            .fontWeight(.semibold)
            .padding(EdgeInsets(top: 8,
                                leading: 16,
                                bottom: 8,
                                trailing: 16))
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(uiColor: .systemGray6))
            )
    }
}

#Preview {
    ErrorWindowView(text: "error")
}
