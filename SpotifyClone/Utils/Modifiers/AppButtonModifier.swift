//
//  AppButtonModifier.swift
//  SpotifyClone
//
//  Created by Eren Kara on 28.11.2022.
//

import SwiftUI

struct AppButtonModifier: ViewModifier {
    var width: Double = 329.0
    var height: Double = 92.0
    var backgroundColor: Color = .colorButton
    var cornerRadius: Double = 30.0

    func body(content: Content) -> some View {
        return content
            .frame(width: width, height: height)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
    }
}
