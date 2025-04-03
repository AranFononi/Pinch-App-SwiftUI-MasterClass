//
//  ControlImageView.swift
//  Pinch App SwiftUI MasterClass
//
//  Created by Aran Fononi on 3/4/25.
//

import SwiftUI

struct ControlImageView: View {
    let icon: String
    var body: some View {
        Image(systemName: icon)
            .font(.system(size: 36))
    }
}

#Preview {
    ControlImageView(icon: "minus.magnifyingglass")
        .preferredColorScheme(.dark)
        .padding()
}
