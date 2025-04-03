//
//  DrawerPanelView.swift
//  Pinch App SwiftUI MasterClass
//
//  Created by Aran Fononi on 3/4/25.
//

import SwiftUI

struct DrawerPanelView: View {
    
    @Binding var isDrawerOpen: Bool
    @Binding var isAnimating: Bool
    @Binding var pageIndex: Int
    let pages: [Page]
    
    var body: some View {
        HStack(spacing: 12) {
            // MARK: - Drawer Handle
            Image(systemName: isDrawerOpen ? "chevron.compact.right" : "chevron.compact.left")
                .resizable()
                .scaledToFit()
                .frame(height: 40)
                .padding(8)
                .foregroundStyle(.secondary)
                .onTapGesture {
                    withAnimation(.spring) {
                        isDrawerOpen.toggle()
                    }
                }
            // MARK: - Thumbnails
            ForEach(pages) { item in
                Image("thumb-\(item.imageName)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 9))
                    .shadow(radius: 4)
                    .opacity(isDrawerOpen ? 1 : 0)
                    .animation(.easeOut(duration: 0.5), value: isDrawerOpen)
                    .onTapGesture {
                        isAnimating = true
                        pageIndex = item.id
                    }
            }
            Spacer()
        }//: Drawer
        .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .opacity(isAnimating ? 1 : 0)
        .padding(.top, UIScreen.main.bounds.height / 12)
        .offset(x: isDrawerOpen ?  20 : 215 )
        .frame(width: 260)
    }
}

#Preview {
    //DrawerPanelView()
}
