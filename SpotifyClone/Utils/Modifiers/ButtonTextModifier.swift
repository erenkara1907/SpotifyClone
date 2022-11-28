//
//  ButtonTextModifier.swift
//  SpotifyClone
//
//  Created by Eren Kara on 25.11.2022.
//

import SwiftUI

struct ButtonTextModifier: ViewModifier {
    var fontSize: Double
    
    func body(content: Content) -> some View {
        return content
            .foregroundColor(.white)
            .font(.system(size: fontSize, weight: .semibold))
    }
}
