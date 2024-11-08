//
//  AvatarVIew.swift
//  exhale
//
//  Created by Анастасия Талмазан on 2024-10-25.
//

import SwiftUI

struct AvatarVIew: View {
    
    var size: CGFloat = 120
    var image: UIImage? = nil
    
    private let defaultImage: String = "person"
    
    var body: some View {
        ZStack {
            if let image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: size, height: size)
                    .scaledToFit()
            } else {
                Image(systemName: defaultImage)
                    .resizable()
                    .frame(width: size, height: size)
                    .padding(size/5)
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.accent)
            }
        }
        .background(Color.textLight)
        .clipShape(Circle())
    }
}

#Preview {
    AvatarVIew()
}
