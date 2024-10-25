//
//  RecordingPracticeView.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-10-25.
//

import SwiftUI

struct RecordingPracticeView: View {
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(.bgColorLight)
                .ignoresSafeArea()
            VStack(spacing: 65) {
                Spacer()
                Button {
                    
                } label: {
                    CustomButton(title: "Start",
                                 verticalPadding: 16)
                }
                .padding(.horizontal, 34)
            }
            .padding(.horizontal, 32)
            .background(BackgoundGradientView())
        }
    }
}

#Preview {
    RecordingPracticeView()
}
