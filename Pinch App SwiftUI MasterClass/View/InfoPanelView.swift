//
//  InfoPanelView.swift
//  Pinch App SwiftUI MasterClass
//
//  Created by Aran Fononi on 3/4/25.
//

import SwiftUI

struct InfoPanelView: View {
    var scale: CGFloat
    var offset: CGSize
    @State private var isInfoPanelVisible: Bool = false
    
    var body: some View {
        HStack {
         // MARK: - Hotsopt
            ZStack {
                Circle()
                    .fill(.ultraThinMaterial)
                    .frame(width: 45, height: 45)
                Image(systemName: "circle.circle")
                    .symbolRenderingMode(.hierarchical)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .symbolEffect(.breathe)
                    .onLongPressGesture(minimumDuration: 1) {
                        withAnimation(.easeOut) {
                            isInfoPanelVisible.toggle()
                        }
                    }
            }
            
            Spacer()
        // MARK: - Info panel
            HStack(spacing: 2) {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                
                Spacer()
                
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")
                
                Spacer()
                
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
                
                Spacer()
                
                
            } //: HStack
            .font(.footnote)
            .padding(8)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .frame(maxWidth: 420)
            .opacity(isInfoPanelVisible ? 1 : 0)
            
            Spacer()
        }
    }
}

#Preview {
    InfoPanelView(scale: 1, offset: .zero)
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
        .padding()
}
