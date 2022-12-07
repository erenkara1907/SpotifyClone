//
//  AuthViewModel.swift
//  SpotifyClone
//
//  Created by Eren Kara on 29.11.2022.
//

import SwiftUI

final class AuthViewModel: ObservableObject {
    // MARK: - SignIn

    @Published var redirectToSignIn: Bool = false
    @Published var redirectToRegister: Bool = false
}
