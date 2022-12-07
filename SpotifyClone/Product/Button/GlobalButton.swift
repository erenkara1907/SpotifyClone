//
//  GlobalButton.swift
//  SpotifyClone
//
//  Created by Eren Kara on 29.11.2022.
//

import SwiftUI

struct GlobalButton: View {
    var onTap: () -> Void
    var text: String
    var textSize: Double
    var width: Double = 329.0
    var height: Double = 92.0
    var backgroundColor: Color = .colorButton
    var cornerRadius: Double = 30.0

    var body: some View {
        Button(action: onTap) {
            Text(text.locale())
                .modifier(ButtonTextModifier(fontSize: textSize))
        }
        .modifier(AppButtonModifier(width: width, height: height, backgroundColor: backgroundColor, cornerRadius: cornerRadius))
    }
}

struct GlobalButton_Previews: PreviewProvider {
    static var previews: some View {
        GlobalButton(onTap: {}, text: "", textSize: 1.0)
            .previewLayout(.sizeThatFits)
    }
}
