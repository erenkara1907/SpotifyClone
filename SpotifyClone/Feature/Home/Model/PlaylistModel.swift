//
//  PlaylistModel.swift
//  SpotifyClone
//
//  Created by Eren Kara on 2.12.2022.
//

import Foundation

struct PlaylistModel: Identifiable {
    var id: UUID = .init()
    var songName: String
    var artistName: String
    var songTime: String

    static let playlists: [PlaylistModel] = [
        PlaylistModel(songName: "As It Was", artistName: "Harry Styles", songTime: "5:33"),
        PlaylistModel(songName: "God Did", artistName: "DJ Khaled", songTime: "3:43"),
        PlaylistModel(songName: "Sevilla", artistName: "Henrique Camacho", songTime: "4:23"),
        PlaylistModel(songName: "Serseri", artistName: "Teoman", songTime: "3:41"),
        PlaylistModel(songName: "Sarı Laleler", artistName: "MFÖ", songTime: "3:20"),
    ]
}
