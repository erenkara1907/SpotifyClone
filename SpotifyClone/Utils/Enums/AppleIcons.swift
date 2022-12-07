//
//  AppleIcons.swift
//  SpotifyClone
//
//  Created by Eren Kara on 29.11.2022.
//

import SwiftUI

struct AppleIcons {
    enum ArrowIcons: String {
        case backward = "chevron.backward"
    }

    enum SearchIcons: String {
        case defualt = "magnifyingglass"
    }

    enum MenuIcons: String {
        case ellipsis
    }

    enum OtherIcons: String {
        case playFill = "play.fill"
        case heartFill = "heart.fill"
        case heart
    }
}

extension String {
    /// String path to icon
    /// - Returns: related icon from SfSymbols
    func icon() -> Image {
        return Image(systemName: self)
    }
}
