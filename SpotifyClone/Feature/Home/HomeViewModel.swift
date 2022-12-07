//
//  HomeViewModel.swift
//  SpotifyClone
//
//  Created by Eren Kara on 1.12.2022.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    // MARK: - Variables

    @Published var selectedTab: Int = 0
    @Published var isRedirectToDetail = false
}
