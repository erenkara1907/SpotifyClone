//
//  TabType.swift
//  SpotifyClone
//
//  Created by Eren Kara on 30.11.2022.
//

import SwiftUI

enum TabType: Int, CaseIterable {
    case home = 0
    case discovery
    case favorite
    case profile

    var tabItem: TabItemModel {
        switch self {
        case .home:
            return TabItemModel(image: ImageItems.App.home.rawValue, selectedImage: ImageItems.App.homeFill.rawValue)
        case .discovery:
            return TabItemModel(image: ImageItems.App.discovery.rawValue, selectedImage: ImageItems.App.discoveryFill.rawValue)
        case .favorite:
            return TabItemModel(image: ImageItems.App.heart.rawValue, selectedImage: ImageItems.App.heartFill.rawValue)
        case .profile:
            return TabItemModel(image: ImageItems.App.profile.rawValue, selectedImage: ImageItems.App.profileFill.rawValue)
        }
    }
}
