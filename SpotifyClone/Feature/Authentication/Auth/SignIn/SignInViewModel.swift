//
//  SignInViewModel.swift
//  SpotifyClone
//
//  Created by Eren Kara on 29.11.2022.
//

import SwiftUI

final class SignInViewModel: ObservableObject {
    // MARK: - TextField Variables

    @Published var emailText: String = ""
    @Published var passwordText: String = ""

    // MARK: - Navigation Variables

    @Published var isBackToAuth: Bool = false
    @Published var isRedirectToHome: Bool = false
}
