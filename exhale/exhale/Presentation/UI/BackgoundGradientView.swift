//
//  BackgoundGradientView.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-10-23.
//

import SwiftUI

struct BackgoundGradientView: View {
    
    private var colors: [Color] =  [Color("bg_color_dark"),
                         Color("bg_color_light")]
    
    var body: some View {
        LinearGradient(colors: colors,
                       startPoint: .top,
                       endPoint: .bottom)
        .ignoresSafeArea()
    }
}

#Preview {
    BackgoundGradientView()
}
