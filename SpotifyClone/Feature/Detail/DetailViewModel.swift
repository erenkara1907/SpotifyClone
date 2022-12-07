//
//  DetailViewModel.swift
//  SpotifyClone
//
//  Created by Eren Kara on 5.12.2022.
//

import SwiftUI

final class DetailViewModel: ObservableObject {
    // MARK: - Variables

    @Published var isRedirectToBack = false
    @Published var isFullScreen = false
}
