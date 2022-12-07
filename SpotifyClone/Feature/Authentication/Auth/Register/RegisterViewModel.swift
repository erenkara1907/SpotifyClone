//
//  RegisterViewModel.swift
//  SpotifyClone
//
//  Created by Eren Kara on 30.11.2022.
//

import SwiftUI

final class RegisterViewModel: ObservableObject {
    // MARK: - TextField Variables

    @Published var fullNameText: String = ""
    @Published var emailText: String = ""
    @Published var passwordText: String = ""

    // MARK: - Navigation Variables

    @Published var isBackToAuth: Bool = false
}
