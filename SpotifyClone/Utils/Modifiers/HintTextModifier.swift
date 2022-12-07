//
//  HintTextModifier.swift
//  SpotifyClone
//
//  Created by Eren Kara on 29.11.2022.
//

import SwiftUI

struct HintTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .foregroundColor(.colorHintText)
            .font(.system(size: 16.0, weight: .semibold))
    }
}
