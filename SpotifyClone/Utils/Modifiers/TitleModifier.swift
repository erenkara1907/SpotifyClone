//
//  TitleModifier.swift
//  SpotifyClone
//
//  Created by Eren Kara on 25.11.2022.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    var fontSize: Double
    
    func body(content: Content) -> some View {
        return content
            .foregroundColor(.colorTitle)
            .font(.system(size: fontSize, weight: .semibold))
    }
}
