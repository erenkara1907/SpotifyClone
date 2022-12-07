//
//  ArtistModel.swift
//  SpotifyClone
//
//  Created by Eren Kara on 2.12.2022.
//

import Foundation

struct ArtistModel: Identifiable {
    var id: UUID = .init()
    var thumbnail: String
    var songName: String
    var artistName: String

    static let artists: [ArtistModel] = [
        ArtistModel(thumbnail: ImageItems.Home.badGuy.rawValue, songName: "Bad Guy", artistName: "Billie Eilish"),
        ArtistModel(thumbnail: ImageItems.Home.scorpion.rawValue, songName: "Scorpion", artistName: "Drake"),
        ArtistModel(thumbnail: ImageItems.Home.when.rawValue, songName: "WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?", artistName: "Billie Eilish"),
    ]
}
