//
//  ChooseModeView.swift
//  SpotifyClone
//
//  Created by Eren Kara on 28.11.2022.
//

import SwiftUI

struct ChooseModeView: View {
    @StateObject var onboardViewModel: OnboardViewModel = .init()
    @Environment(\.colorScheme) private var colorScheme: ColorScheme

    var body: some View {
        NavigationStack {
            ZStack {
                ImageItems.Onboard.duaLipa.rawValue.image()
                    .resizable()
                VStack {
                    ImageItems.App.appLogo.rawValue.image()
                        .padding(.top, 55.0)
                    Spacer()
                    Text(LocaleKeys.Onboard.chooseMode.rawValue.locale())
                        .modifier(TitleModifier(fontSize: 22.0))

                    HStack {
                        ModeButtonView(image: ImageItems.App.moon.rawValue.image(), callBack: {
                            onboardViewModel.isDarkTap = false
                            onboardViewModel.isTap = true
                            onboardViewModel.changeThemeMode(state: UserCacheKeys.lightMode)

                        }, isTap: onboardViewModel.isTap, text: LocaleKeys.Onboard.lightMode.rawValue)
                            .animation(.linear(duration: 0.6), value: onboardViewModel.isTap)

                        Spacer(minLength: 10.0)

                        ModeButtonView(image: ImageItems.App.sun.rawValue.image(), callBack: {
                            onboardViewModel.isTap = false
                            onboardViewModel.isDarkTap = true
                            onboardViewModel.changeThemeMode(state: UserCacheKeys.darkMode)

                        }, isTap: onboardViewModel.isDarkTap, text: LocaleKeys.Onboard.darkMode.rawValue)
                            .animation(.linear(duration: 0.6), value: onboardViewModel.isDarkTap)
                    } // HStack
                    .padding(.horizontal, 10.0)
                    .padding(.bottom, 68.0)
                    .padding(.top, 32.0)
                    .frame(width: 233.0)

                    GlobalButton(onTap: {
                        onboardViewModel.saveUserLoginAndRedirect()
                    }, text: LocaleKeys.Global.continueString.rawValue, textSize: 22.0)
                        .padding(.bottom, 69.0)
                } // VStack
            } // ZStack
            .onAppear {
                onboardViewModel.setAppTheme()
            }
            .navigationDestination(isPresented: $onboardViewModel.isAuthRedirect, destination: {
                AuthView()
                    .navigationBarBackButtonHidden()
            })
            .ignoresSafeArea()
        } // NavigationStack
    }
}

struct ChooseModeView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseModeView()
    }
}

private struct ModeButtonView: View {
    var image: Image
    var callBack: () -> Void
    var isTap: Bool = false
    var text: String

    var body: some View {
        VStack {
            ZStack {
                isTap ? Circle()
                    .modifier(ModeButtonCircleBackground()) : nil
                Button(action: callBack, label: { image })
                    .modifier(ModeButtonModifier(isTap: isTap))
            } // ZStack
            Text(text.locale())
                .multilineTextAlignment(.center)
                .modifier(TitleModifier(fontSize: 17.0))
        } // VStack
    }
}
