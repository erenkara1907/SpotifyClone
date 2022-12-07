//
//  SocialButton.swift
//  SpotifyClone
//
//  Created by Eren Kara on 30.11.2022.
//

import SwiftUI

struct SocialButton: View {
    var body: some View {
        HStack {
            ImageItems.App.google.rawValue.image()
                .resizable()
                .frame(width: 33.0, height: 36.0)
                .padding(.trailing, 58.28)

            ImageItems.App.apple.rawValue.image()
                .resizable()
                .frame(width: 33.0, height: 36.0)
        }
        .padding(.top, 44.0)
    }
}

struct SocialButton_Previews: PreviewProvider {
    static var previews: some View {
        SocialButton()
    }
}
