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
        case bigLogo = "ic_big_logo"
        case moon = "ic_moon"
        case sun = "ic_sun"
        case google = "ic_google"
        case apple = "ic_apple"
        case discovery = "safari"
        case discoveryFill = "safari.fill"
        case heart
        case heartFill = "heart.fill"
        case home = "house"
        case homeFill = "house.fill"
        case profile = "person"
        case profileFill = "person.fill"
        case dua = "img_dua"
    }

    enum Authentication: String {
        case billieEllish = "img_billie"
        case unionBottom = "img_union_bottom"
        case unionTop = "img_union_top"
    }

    enum Onboard: String {
        case arianaGrande = "img_ariana_grande"
        case duaLipa = "img_dua_lipa"
    }

    enum Home: String {
        case billieEllish = "img_billie_ellish"
        case badGuy = "img_bad_guy"
        case scorpion = "img_scorpion"
        case when = "img_when"
    }

    enum Detail: String {
        case icNext = "ic_next"
        case icPause = "ic_pause"
        case icPrevious = "ic_previous"
        case icRepeate = "ic_repeate"
        case icShuffle = "ic_shuffle"
    }
    
    enum Favorite: String {
        case anatolia = "img_thumb_anatolia"
        case deterjan = "img_thumb_deterjan"
        case domino = "img_thumb_domino"
        case dontBeShy = "img_thumb_dontBeShy"
        case home = "img_thumb_home"
        case pepas = "img_thumb_pepas"
        case psyTest = "img_thumb_psyTest"
        case sumeru = "img_thumb_sumeru"
        case person = "img_person"
    }
}

extension String {
    /// String path to image
    /// - Returns: related image from Image asset
    func image() -> Image {
        return Image(self)
    }
}
