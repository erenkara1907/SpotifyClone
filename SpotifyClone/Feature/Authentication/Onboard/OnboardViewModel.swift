//
//  OnboardViewModel.swift
//  SpotifyClone
//
//  Created by Eren Kara on 28.11.2022.
//

import SwiftUI

final class OnboardViewModel: ObservableObject {
    // MARK: - Onboard Variables

    @Published var isAuthRedirect: Bool = false
    @Published var isActive: Bool = false

    // MARK: - Theme Variables

    @Published var isTap: Bool = false
    @Published var isDarkTap: Bool = false

    @Environment(\.colorScheme) private var colorScheme: ColorScheme

    private let cache: IUserCache = UserDefaultCache()
    private let themeCache: IUserCache = ThemeCache()

    // MARK: - Onboard Cache

    private func isUserFirstLogin() -> Bool {
        return cache.read(key: .onboard).isEmpty
    }

    func checkUserFirstTime() {
        guard !isUserFirstLogin() else {
            updateCacheFirstLogin()
            return
        }

        redirectToAuth()
    }

    func saveUserLoginAndRedirect() {
        updateCacheFirstLogin()
        redirectToAuth()
    }

    private func redirectToAuth() {
        isAuthRedirect = true
    }

    private func updateCacheFirstLogin() {
        cache.save(key: .onboard, value: UserCacheKeys.dummyValue)
    }

    func removeCacheFirstLogin(key: UserCacheKeys) {
        cache.remove(key: key)
    }

    // MARK: - Theme Operation

    func changeThemeMode(state: String) {
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first!.overrideUserInterfaceStyle = state == UserCacheKeys.darkMode ? .dark : .light
        themeCache.save(key: .themeMode, value: state)
    }

    func setAppTheme() {
        var mode = themeCache.read(key: .themeMode)
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first!.overrideUserInterfaceStyle = mode == UserCacheKeys.darkMode ? .dark : .light

        if colorScheme == .dark {
            isDarkTap = true
        } else {
            isTap = true
        }
    }
}
