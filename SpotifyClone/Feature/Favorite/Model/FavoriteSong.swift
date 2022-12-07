//
//  FavoriteSong.swift
//  SpotifyClone
//
//  Created by Eren Kara on 6.12.2022.
//

import Foundation

struct FavoriteSong: Identifiable {
    let id: UUID = UUID()
    let songName: String
    let artistName: String
    let thumbnail: String
    
    static let favoriteSongs: [FavoriteSong] = [
        FavoriteSong(songName: "Deterjan (feat. Can Gol)", artistName: "Hey! Douglas, Can Gol", thumbnail: ImageItems.Favorite.deterjan.rawValue),
        FavoriteSong(songName: "Pepas - Tiesto Remix", artistName: "Farruko, Tiesto", thumbnail: ImageItems.Favorite.pepas.rawValue),
        FavoriteSong(songName: "Home", artistName: "Adriatique, Marino Canal, Delhi De France", thumbnail: ImageItems.Favorite.home.rawValue),
        FavoriteSong(songName: "Anatolia", artistName: "Thylacine", thumbnail: ImageItems.Favorite.anatolia.rawValue),
        FavoriteSong(songName: "Sumeru", artistName: "islandman", thumbnail: ImageItems.Favorite.sumeru.rawValue),
        FavoriteSong(songName: "Don't Be Shy", artistName: "Tiesto, KAROL G", thumbnail: ImageItems.Favorite.dontBeShy.rawValue),
        FavoriteSong(songName: "Domino", artistName: "Oxia", thumbnail: ImageItems.Favorite.domino.rawValue),
        FavoriteSong(songName: "PsyTest", artistName: "AlpenX", thumbnail: ImageItems.Favorite.psyTest.rawValue)
    ]
}
