//
//  LocaleKeys.swift
//  SpotifyClone
//
//  Created by Eren Kara on 25.11.2022.
//

import SwiftUI

struct LocaleKeys {
    enum Onboard: String {
        case onboardTitle
        case onboardContent
        case chooseMode
        case darkMode
        case lightMode
        case getStarted
    }

    enum Global: String {
        case continueString = "continue"
    }

    enum Authentication: String {
        case register
        case signIn
        case authTitle
        case authContent
    }

    enum SignIn: String {
        case signInTitle
        case signInDescription
        case email
        case password
        case recoveryPassword = "Recovery Password"
        case registerNow
        case or
    }

    enum Register: String {
        case registerTitle
        case registerDescription
        case fullname
        case registerEmail
        case registerPassword
        case createAccount
        case haveAccount
    }

    enum Home: String {
        case news
        case video
        case artists
        case podcast
        case playlist
        case seeMore
    }

    enum Detail: String {
        case nowPlaying
        case lyrics
    }
    
    enum Favorite: String {
        case profile = "profile"
        case follower = "follower"
        case follow = "follow"
        case publicPlay = "publicPlay"
    }
}

extension String {
    /// It localize any string from Localizable.string
    /// - Returns: Localized value
    func locale() -> LocalizedStringKey {
        return LocalizedStringKey(self)
    }
}
