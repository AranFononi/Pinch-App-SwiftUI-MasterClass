//
//  ContentView.swift
//  Pinch App SwiftUI MasterClass
//
//  Created by Aran Fononi on 2/4/25.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Property
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    @State private var imageName: String = "magazine-front-cover"
    
    // MARK: - Function
    func resetImageState() {
        return withAnimation(.spring()) {
            imageScale = 1
            imageOffset = .zero
        }
    }
    
    // MARK: - Content
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.clear
                // MARK: - Page Image
                ImageView(isAnimating: $isAnimating, offset: $imageOffset, scale: $imageScale, imageName: imageName)
                // MARK: - Tap Gesture
                    .onTapGesture(count: 2) {
                        if imageScale == 1 {
                            withAnimation(.spring()) {
                                imageScale = 5
                            }
                        } else {
                            resetImageState()
                        }
                    }
                // MARK: - Drag Gesture
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.linear(duration: 1)) {
                                    imageOffset = value.translation
                                }
                                
                            }
                            .onEnded { _ in
                                withAnimation(.linear(duration: 1)) {
                                    if imageScale <= 1 {
                                        resetImageState()
                                        
                                    }
                                    
                                }
                            }
                    )
                // MARK: - Magnification
                    .gesture(
                        MagnificationGesture()
                            .onChanged { value in
                                withAnimation(.linear(duration: 1)) {
                                    if imageScale >= 1 && imageScale <= 8 {
                                        imageScale = value
                                    } else if imageScale > 8 {
                                        imageScale = 8
                                    }
                                }
                            }
                            .onEnded { _ in
                                if imageScale > 8 {
                                    imageScale = 8
                                } else if imageScale <= 1 {
                                    resetImageState()
                                }
                            }
                    )
            } // ZStack
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear() {
                isAnimating = true
            }
            // MARK: - Info Panel
            .overlay(
                InfoPanelView(scale: imageScale, offset: imageOffset).padding(.horizontal).padding(.top, 30),
                alignment: .top
            )
            .overlay(
                ControlPanelView(scale: $imageScale, isAnimating: $isAnimating, offset: $imageOffset),
                alignment: .bottom
            )
        } // NavigationView
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
