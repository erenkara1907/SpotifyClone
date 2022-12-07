//
//  CategoryModel.swift
//  SpotifyClone
//
//  Created by Eren Kara on 1.12.2022.
//

import Foundation

struct CategoryModel: Identifiable {
    var id: UUID = .init()
    var text: String

    static let categories: [CategoryModel] = [
        CategoryModel(text: LocaleKeys.Home.news.rawValue),
        CategoryModel(text: LocaleKeys.Home.video.rawValue),
        CategoryModel(text: LocaleKeys.Home.artists.rawValue),
        CategoryModel(text: LocaleKeys.Home.podcast.rawValue),
    ]
}
