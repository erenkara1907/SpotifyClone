//
//  SignInView.swift
//  SpotifyClone
//
//  Created by Eren Kara on 29.11.2022.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var signInViewModel: SignInViewModel = .init()

    var body: some View {
        NavigationStack {
            GeometryReader { _ in
                ZStack {
                    Color.colorAppBackground
                    VStack {
                        TopBarView(signInViewModel: signInViewModel)
                        Spacer()
                        HeaderTexts()
                        TextFields(signInViewModel: signInViewModel)
                        HStack {
                            Text(LocaleKeys.SignIn.recoveryPassword.rawValue.locale())
                                .modifier(DescriptionModifier(fontSize: 14.0))

                            Spacer()
                        } // HStack
                        .padding(.vertical, 20.0)

                        GlobalButton(onTap: {
                            signInViewModel.isRedirectToHome = true
                        }, text: LocaleKeys.SignIn.signInTitle.rawValue, textSize: 20.0, height: 80.0)

                        OrView()
                        SocialButton()
                        Text(LocaleKeys.SignIn.registerNow.rawValue.locale())
                            .modifier(DescriptionModifier(fontSize: 14.0))
                            .padding(.top, 37.0)

                        Spacer()
                    } // VStack
                    .padding(.top, 55.0)
                    .padding(.horizontal, 33.0)
                } // ZStack
                .ignoresSafeArea()
            } // GeometryReader
            .navigationDestination(isPresented: $signInViewModel.isRedirectToHome, destination: {
                PagesView()
                    .navigationBarBackButtonHidden()
            })
            .navigationDestination(isPresented: $signInViewModel.isBackToAuth) {
                AuthView()
                    .navigationBarBackButtonHidden()
            }
        } // NavigationStack
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

private struct TopBarView: View {
    var signInViewModel: SignInViewModel

    var body: some View {
        HStack {
            BackButton {
                signInViewModel.isBackToAuth = true
            }
            Spacer()
            ImageItems.App.appLogo.rawValue.image()
                .resizable()
                .frame(width: 108.0, height: 33.0)
            Spacer()
        } // HStack
    }
}

private struct HeaderTexts: View {
    var body: some View {
        Group {
            Text(LocaleKeys.SignIn.signInTitle.rawValue.locale())
                .modifier(TitleModifier(fontSize: 30.0))
                .padding(.bottom, 22.0)

            Text(LocaleKeys.SignIn.signInDescription.rawValue.locale())
                .accentColor(.colorButton)
                .modifier(DescriptionModifier(fontSize: 12.0))
                .padding(.bottom, 38.0)
        }
    }
}

private struct TextFields: View {
    @StateObject var signInViewModel: SignInViewModel
    var body: some View {
        Group {
            AuthTextFieldView(placeholder: Text(LocaleKeys.SignIn.email.rawValue.locale())
                .foregroundColor(.colorHintText)
                .font(.system(size: 16.0, weight: .semibold)),
                text: $signInViewModel.emailText)
                .modifier(TextFieldModifier())
                .padding(.bottom, 5.0)

            SecureTextFieldView(text: $signInViewModel.passwordText, placeholder: Text(LocaleKeys.SignIn.password.rawValue.locale())
                .foregroundColor(.colorHintText)
                .font(.system(size: 16.0, weight: .semibold)))
                .modifier(TextFieldModifier())
        }
    }
}

private struct OrView: View {
    var body: some View {
        HStack {
            VStack {
                Divider()
                    .frame(height: 1.2)
                    .background(LinearGradient(colors: [.gray, .colorAppBackground], startPoint: .leading, endPoint: .trailing))
            } // VStack
            Text(LocaleKeys.SignIn.or.rawValue.locale())
                .modifier(DescriptionModifier(fontSize: 12.0))
            VStack {
                Divider()
                    .frame(height: 1.2)
                    .background(LinearGradient(colors: [.gray, .colorAppBackground], startPoint: .trailing, endPoint: .leading))
            } // VStack
        } // HStack
        .padding(.top, 21.0)
    }
}
