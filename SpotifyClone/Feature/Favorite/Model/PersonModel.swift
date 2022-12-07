//
//  PersonModel.swift
//  SpotifyClone
//
//  Created by Eren Kara on 6.12.2022.
//

import Foundation

struct PersonModel: Identifiable {
    let id: UUID = UUID()
    let username: String = "Soroushnrz"
    let email: String = "Soroushnorozyui@gmail.com"
    let profilePhoto: String = ImageItems.Favorite.person.rawValue
}
