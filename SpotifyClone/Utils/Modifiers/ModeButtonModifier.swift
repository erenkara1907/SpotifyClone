//
//  ModeButtonModifier.swift
//  SpotifyClone
//
//  Created by Eren Kara on 28.11.2022.
//

import SwiftUI

struct ModeButtonModifier: ViewModifier {
    var isTap: Bool = false

    func body(content: Content) -> some View {
        return content
            .frame(width: 73.0, height: 73.0)
            .background(
                isTap ? LinearGradient(gradient: Gradient(colors: [.green.opacity(0.45), .green.opacity(0.15)]), startPoint: .bottom, endPoint: .top) : LinearGradient(gradient: Gradient(colors: [.colorDisabledButton]), startPoint: .bottom, endPoint: .top)
            )
            .background(.black)
            .clipShape(Capsule())
    }
}
