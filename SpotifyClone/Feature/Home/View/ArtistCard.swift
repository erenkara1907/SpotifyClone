//
//  ArtistCard.swift
//  SpotifyClone
//
//  Created by Eren Kara on 2.12.2022.
//

import SwiftUI

struct ArtistCard: View {
    let model: ArtistModel

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Rectangle()
                .frame(width: 147.0, height: 235.0)
                .opacity(0.0)

            VStack(alignment: .leading) {
                Image(model.thumbnail)
                    .resizable()
                    .frame(width: 147.0, height: 185.0)

                Group {
                    Text(model.songName)
                        .font(.system(size: 16.0, weight: .bold))
                        .frame(width: 70.0, height: 22.0)
                        .foregroundColor(.white)
                        .padding(.top, 10.0)
                        .padding(.bottom, 0.01)

                    Text(model.artistName)
                        .modifier(TitleModifier(fontSize: 14.0))
                } // Group
                .padding(.leading, 10.0)
            } // VStack

            ZStack(alignment: .center) {
                Circle()
                    .frame(width: 29.0, height: 29.0)
                    .foregroundColor(.colorSecondary)

                AppleIcons.OtherIcons.playFill.rawValue.icon()
                    .resizable()
                    .foregroundColor(.colorHintText)
                    .frame(width: 12.0, height: 12.0)
            } // ZStack
            .padding(.bottom, 53.0)
            .padding(.trailing, 12.0)
        } // ZStack
        .padding(.trailing, 5.0)
    }
}

struct ArtistCard_Previews: PreviewProvider {
    static var previews: some View {
        ArtistCard(model: ArtistModel(thumbnail: "", songName: "", artistName: ""))
    }
}
