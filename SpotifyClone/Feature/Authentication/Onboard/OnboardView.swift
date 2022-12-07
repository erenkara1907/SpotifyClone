//
//  OnboardView.swift
//  SpotifyClone
//
//  Created by Eren Kara on 25.11.2022.
//

import SwiftUI

struct OnboardView: View {
    @StateObject private var onboardViewModel: OnboardViewModel = .init()

    var body: some View {
        NavigationStack {
            ZStack {
                ImageItems.Onboard.arianaGrande.rawValue.image()
                    .resizable()

                VStack {
                    ImageItems.App.appLogo.rawValue.image()
                        .padding(.top, 55.0)
                    Spacer()

                    Texts()
                        .padding(.horizontal, 53.0)

                    GlobalButton(onTap: {
                        onboardViewModel.isActive = true
                    }, text: LocaleKeys.Onboard.getStarted.rawValue, textSize: 22.0)
                        .padding(.bottom, 69.0)
                } // VStack
            } // ZStack
            .onAppear {
                onboardViewModel.setAppTheme()
                onboardViewModel.checkUserFirstTime()
            }
            .navigationDestination(isPresented: $onboardViewModel.isAuthRedirect, destination: {
                AuthView()
                    .navigationBarBackButtonHidden()
            })
            .navigationDestination(isPresented: $onboardViewModel.isActive) {
                ChooseModeView()
                    .navigationBarBackButtonHidden()
            }
            .ignoresSafeArea()
        } // NavigationStack
    }
}

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView()
    }
}

private struct Texts: View {
    var body: some View {
        Group {
            Text(LocaleKeys.Onboard.onboardTitle.rawValue.locale())
                .modifier(TitleModifier(fontSize: 25.0))
                .padding(.bottom, 21.0)
                .multilineTextAlignment(.center)

            Text(LocaleKeys.Onboard.onboardContent.rawValue.locale())
                .modifier(DescriptionModifier(fontSize: 17.0))
                .padding(.bottom, 37.0)
        }
    }
}
