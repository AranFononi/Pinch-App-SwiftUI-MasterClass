//
//  ControlPanelView.swift
//  Pinch App SwiftUI MasterClass
//
//  Created by Aran Fononi on 3/4/25.
//

import SwiftUI

struct ControlPanelView: View {
    @Binding var scale: CGFloat
    var isAnimating: Bool
    @Binding var offset: CGSize
    
    func resetImageState() {
        return withAnimation(.spring()) {
            scale = 1
            offset = .zero
        }
    }
    
    var body: some View {
        Group {
            HStack {
                // MARK: - Scale Down
                Button {
                    withAnimation(.spring()) {
                        if scale > 1 {
                            scale -= 1
                        }
                        if scale <= 1 {
                            resetImageState()
                        }
                    }
                } label: {
                    ControlImageView(icon: "minus.magnifyingglass")
                }
                
                // MARK: - Reset
                Button {
                    withAnimation(.spring()) {
                        scale = 1
                        resetImageState()
                    }
                } label: {
                    ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
                }
                
                // MARK: - Scale Up
                Button {
                    withAnimation(.spring()) {
                        if scale < 8 {
                            scale += 1
                            if scale > 8 {
                                scale = 8
                            }
                        }
                    }
                } label: {
                    ControlImageView(icon: "plus.magnifyingglass")
                }
            }
            .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .opacity(isAnimating ? 1 : 0)
        }
        .padding(.bottom, 30)
    }
}

#Preview {
    @Previewable @State var scale: CGFloat = 1
    @Previewable @State var offset: CGSize = .zero
    ControlPanelView(scale: $scale, isAnimating: true, offset: $offset)
}
