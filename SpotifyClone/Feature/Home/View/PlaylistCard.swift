//
//  PlaylistCard.swift
//  SpotifyClone
//
//  Created by Eren Kara on 2.12.2022.
//

import SwiftUI

struct PlaylistCard: View {
    let model: PlaylistModel

    var body: some View {
        HStack {
            Group {
                ZStack(alignment: .center) {
                    Circle()
                        .frame(width: 37.0, height: 37.0)
                        .foregroundColor(.colorSecondary)

                    AppleIcons.OtherIcons.playFill.rawValue.icon()
                        .frame(width: 13.1, height: 13.81)
                        .foregroundColor(.colorHintText)
                } // ZStack

                VStack(alignment: .leading) {
                    Text(model.songName.trimmingCharacters(in: .whitespacesAndNewlines))
                        .modifier(TitleModifier(fontSize: 16.0))
                        .padding(.bottom, 0.01)

                    Text(model.artistName.trimmingCharacters(in: .whitespacesAndNewlines))
                        .modifier(DescriptionModifier(fontSize: 12.0))
                } // VStack
                .padding(.leading, 14.0)
            } // Group
            Spacer()
            Group {
                Text(model.songTime.trimmingCharacters(in: .whitespacesAndNewlines))
                    .modifier(TitleModifier(fontSize: 15.0))

                AppleIcons.OtherIcons.heartFill.rawValue.icon()
                    .resizable()
                    .frame(width: 21.0, height: 21.0)
                    .foregroundColor(.colorSecondary)
                    .padding(.leading, 49.0)
            }
        } // HStack
        .padding(.top, 23.0)
    }
}

struct PlaylistCard_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistCard(model: PlaylistModel(songName: "Aldattım", artistName: "Dolu Kadehi Ters Tut", songTime: "3:28"))
            .previewLayout(.sizeThatFits)
    }
}
