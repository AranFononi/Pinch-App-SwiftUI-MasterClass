//
//  ContentView.swift
//  Pinch App SwiftUI MasterClass
//
//  Created by Aran Fononi on 2/4/25.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Property
    
    // MARK: - Function
    
    // MARK: - Content
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
