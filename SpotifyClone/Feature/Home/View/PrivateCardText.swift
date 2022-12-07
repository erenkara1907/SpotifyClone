//
//  PrivateCardText.swift
//  SpotifyClone
//
//  Created by Eren Kara on 2.12.2022.
//

import SwiftUI

struct PrivateCardText: View {
    let text: String
    let fontSize: Double

    var body: some View {
        Text(text)
            .font(.system(size: fontSize, weight: .semibold))
            .foregroundColor(.white)
    }
}

struct PrivateCardText_Previews: PreviewProvider {
    static var previews: some View {
        PrivateCardText(text: "", fontSize: 0.0)
            .previewLayout(.sizeThatFits)
    }
}
