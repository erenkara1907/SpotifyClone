//
//  ModeButtonCircleBackground.swift
//  SpotifyClone
//
//  Created by Eren Kara on 28.11.2022.
//

import SwiftUI

struct ModeButtonCircleBackground: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .frame(width: 45.0, height: 70.0)
            .background(Color.colorButton)
            .cornerRadius(60.0)
            .padding(.top, 10.0)
    }
}
