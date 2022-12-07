//
//  SplashView.swift
//  SpotifyClone
//
//  Created by Eren Kara on 25.11.2022.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color("appBackground")

            ImageItems.App.appLogo.rawValue.image()
        } // ZStack
        .ignoresSafeArea()
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
