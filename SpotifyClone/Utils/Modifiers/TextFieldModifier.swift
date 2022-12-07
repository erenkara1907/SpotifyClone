//
//  TextFieldModifier.swift
//  SpotifyClone
//
//  Created by Eren Kara on 29.11.2022.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    var verticalPadding: Double = 30.0
    var horizontalPadding: Double = 20.0

    func body(content: Content) -> some View {
        return content
            .padding(.vertical, verticalPadding)
            .padding(.horizontal, horizontalPadding)
            .overlay(RoundedRectangle(cornerRadius: 30.0).stroke(Color.colorHintText))
            .foregroundColor(.colorHintText)
    }
}
