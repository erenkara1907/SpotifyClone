//
//  Images.swift
//  SpotifyClone
//
//  Created by Eren Kara on 25.11.2022.
//

import SwiftUI

struct ImageItems {
    enum App: String {
        case appLogo = "ic_app_logo"
    }
    
    enum Authentication: String {
        case arianaGrande = "img_ariana_grande"
    }
}

extension String {
    /// String path to image
    /// - Returns: related image from Image asset
    func image() -> Image {
        return Image(self)
    }
}
