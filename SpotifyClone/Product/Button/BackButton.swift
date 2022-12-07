//
//  BackButton.swift
//  SpotifyClone
//
//  Created by Eren Kara on 29.11.2022.
//

import SwiftUI

struct BackButton: View {
    var onTapGesture: () -> Void

    var body: some View {
        ZStack {
            Circle()
            AppleIcons.ArrowIcons.backward.rawValue.icon()
                .resizable()
                .foregroundColor(.colorTitle)
                .frame(width: 6.5, height: 11.5)
        } // ZStack
        .onTapGesture(perform: onTapGesture)
        .foregroundColor(.colorBackButton)
        .frame(width: 32.0, height: 32.0)
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(onTapGesture: {})
    }
}
