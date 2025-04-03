//
//  ImageView.swift
//  Pinch App SwiftUI MasterClass
//
//  Created by Aran Fononi on 3/4/25.
//

import SwiftUI

struct ImageView: View {
    @Binding var isAnimating: Bool
    @Binding var offset: CGSize
    @Binding var scale: CGFloat
    var imageName : String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
            .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
            .opacity(isAnimating ? 1 : 0)
            .offset(x: offset.width, y: offset.height)
            .scaleEffect(scale)
            .animation(.linear(duration: 1), value: isAnimating)
    }
}

#Preview {
    //ImageView()
}
