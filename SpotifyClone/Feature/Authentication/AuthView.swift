//
//  AuthView.swift
//  SpotifyClone
//
//  Created by Eren Kara on 28.11.2022.
//

import SwiftUI

struct AuthView: View {
    @StateObject private var authViewModel: AuthViewModel = .init()
    @StateObject private var onboardViewModel: OnboardViewModel = .init()

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    Color.colorAppBackground
                    BackgroundView(geometry: geometry)
                    VStack {
                        ImageItems.App.bigLogo.rawValue.image()
                            .padding(.bottom, 45.0)

                        Text(LocaleKeys.Authentication.authTitle.rawValue.locale())
                            .padding(.bottom, 21.0)
                            .modifier(TitleModifier(fontSize: 26.0))
                            .multilineTextAlignment(.center)

                        Text(LocaleKeys.Authentication.authContent.rawValue.locale())
                            .modifier(DescriptionModifier(fontSize: 17.0))
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 30.0)

                        HStack {
                            GlobalButton(onTap: {
                                authViewModel.redirectToRegister = true
                            }, text: LocaleKeys.Authentication.register.rawValue, textSize: 19.0, width: geometry.dynamicWidth(width: 0.4), height: 73.0)

                            GlobalButton(onTap: {
                                authViewModel.redirectToSignIn = true
                            }, text: LocaleKeys.Authentication.signIn.rawValue, textSize: 19.0,
                            width: geometry.dynamicWidth(width: 0.4), height: 73.0,
                            backgroundColor: Color.colorAppBackground)
                        } // HStack
                    } // VStack
                    .padding(.horizontal, 15.0)
                    .frame(width: geometry.dynamicWidth(width: 1.0), height: geometry.dynamicHeight(height: 1.0), alignment: .center)
                } // ZStack
                .ignoresSafeArea()
            } // GeometryReader
            .navigationDestination(isPresented: $authViewModel.redirectToSignIn) {
                SignInView()
                    .navigationBarBackButtonHidden()
            }
            .navigationDestination(isPresented: $authViewModel.redirectToRegister) {
                RegisterView()
                    .navigationBarBackButtonHidden()
            }
        } // NavigationStack
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

private struct BackgroundView: View {
    var geometry: GeometryProxy

    var body: some View {
        VStack {
            ImageItems.Authentication.unionTop.rawValue.image()
                .frame(width: geometry.dynamicWidth(width: 1.0), height: geometry.dynamicHeight(height: 0.15), alignment: .trailing)

            Spacer()

            ZStack {
                ImageItems.Authentication.billieEllish.rawValue.image()
                    .resizable()
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        ImageItems.Authentication.unionBottom.rawValue.image()
                            .resizable()

                            .frame(width: geometry.dynamicWidth(width: 0.35), height: geometry.dynamicHeight(height: 0.35), alignment: .trailing)
                    }
                } // HStack
            } // ZStack
            .frame(width: geometry.dynamicWidth(width: 1.0), height: geometry.dynamicHeight(height: 0.65), alignment: .bottom)
        } // VStack
    }
}

private struct AuthButton: View {
    var geometry: GeometryProxy
    var label: String
    var isRegister: Bool
    var onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            Text(label.locale())
                .modifier(TitleModifier(fontSize: 19.0))
        }
        .frame(width: geometry.dynamicWidth(width: 0.4), height: 73.0)
        .background(isRegister ? Color.colorButton : Color.colorAppBackground)
        .cornerRadius(30.0)
    }
}
