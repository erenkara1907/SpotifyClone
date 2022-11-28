//
//  DescriptionModifier.swift
//  SpotifyClone
//
//  Created by Eren Kara on 25.11.2022.
//

import SwiftUI

struct DescriptionModifier: ViewModifier {
    var fontSize: Double
    
    func body(content: Content) -> some View {
        return content
            .foregroundColor(.colorDescription)
            .multilineTextAlignment(.center)
            .font(.system(size: fontSize, weight: .regular))
    }
}
