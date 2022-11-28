//
//  LocaleKeys.swift
//  SpotifyClone
//
//  Created by Eren Kara on 25.11.2022.
//

import SwiftUI

struct LocaleKeys {
    enum Authentication: String {
        case onboardTitle = "onboardTitle"
        case onboardContent = "onboardContent"
    }
}

extension String {
    /// It localize any string from Localizable.string
    /// - Returns: Localized value
    func locale() -> LocalizedStringKey {
        return LocalizedStringKey(self)
    }
}
