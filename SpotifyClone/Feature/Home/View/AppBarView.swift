//
//  TopBarView.swift
//  SpotifyClone
//
//  Created by Eren Kara on 2.12.2022.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(spacing: 15.0) {
                AppBarView()
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(height: 118.0)
                        .foregroundColor(.colorButton)
                        .cornerRadius(30.0)
                        .opacity(0.9)

                    VStack(alignment: .leading) {
                        PrivateCardText(text: "New Album", fontSize: 12.0)
                            .multilineTextAlignment(.leading)
                        PrivateCardText(text: "Happier Than\nEver", fontSize: 23.0)
                            .multilineTextAlignment(.leading)
                        PrivateCardText(text: "Billie Eilish", fontSize: 15.0)
                            .multilineTextAlignment(.leading)
                    } // VStack
                    .padding(.leading, 19.0)
                } // ZStack
            } // VStack
            ImageItems.Home.billieEllish.rawValue.image()
                .resizable()
                .frame(width: 325.0, height: 183.0)
                .padding(.bottom, 16.0)
                .padding(.leading, 20.0)
        } // ZStack
    }
}

struct AppBarView: View {
    var body: some View {
        HStack {
            Button {
                // some code
            } label: {
                AppleIcons.SearchIcons.defualt.rawValue.icon()
                    .resizable()
                    .frame(width: 25.0, height: 25.0)
                    .foregroundColor(.colorIcon)
            } // Button

            Spacer()
            ImageItems.App.appLogo.rawValue.image()
                .resizable()
                .frame(width: 108.0, height: 33.0)
            Spacer()

            Button {
                // some code
            } label: {
                AppleIcons.MenuIcons.ellipsis.rawValue.icon()
                    .resizable()
                    .frame(width: 25.0, height: 6.0)
                    .foregroundColor(.colorIcon)
                    .rotationEffect(.degrees(-90.0))
            } // Button
        } // HStack
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppBarView()
            .previewLayout(.sizeThatFits)
    }
}
