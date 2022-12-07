//
//  SignInView.swift
//  SpotifyClone
//
//  Created by Eren Kara on 29.11.2022.
//

import SwiftUI

struct RegisterView: View {
    @StateObject private var registerViewModel: RegisterViewModel = .init()

    var body: some View {
        NavigationStack {
            GeometryReader { _ in
                ZStack {
                    Color.colorAppBackground
                    ScrollView {
                        VStack {
                            TopBarView(registerViewModel: registerViewModel)
                            Spacer()
                            HeaderTexts()
                            TextFields(registerViewModel: registerViewModel)
                            HStack {
                                Text(LocaleKeys.SignIn.recoveryPassword.rawValue.locale())
                                    .modifier(DescriptionModifier(fontSize: 14.0))

                                Spacer()
                            } // HStack
                            .padding(.vertical, 20.0)

                            GlobalButton(onTap: {
                                // some code
                            }, text: LocaleKeys.Register.createAccount.rawValue, textSize: 20.0, height: 80.0)

                            OrView()
                            SocialButton()

                            Text(LocaleKeys.Register.haveAccount.rawValue.locale())
                                .modifier(DescriptionModifier(fontSize: 14.0))
                                .padding(.top, 27.0)
                                .padding(.bottom, 15.0)
                        } // VStack
                        .padding(.top, 55.0)
                        .padding(.horizontal, 33.0)
                    } // ScrollView
                } // ZStack
            } // GeometryReader
            .navigationDestination(isPresented: $registerViewModel.isBackToAuth, destination: {
                AuthView()
                    .navigationBarBackButtonHidden()
            })
            .ignoresSafeArea(.all)
        } // NavigationStack
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

private struct TopBarView: View {
    var registerViewModel: RegisterViewModel
    var body: some View {
        HStack {
            BackButton {
                registerViewModel.isBackToAuth = true
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
            Text(LocaleKeys.Register.registerTitle.rawValue.locale())
                .modifier(TitleModifier(fontSize: 30.0))
                .padding(.bottom, 22.0)

            Text(LocaleKeys.Register.registerDescription.rawValue.locale())
                .accentColor(.colorButton)
                .modifier(DescriptionModifier(fontSize: 12.0))
                .padding(.bottom, 38.0)
        }
    }
}

private struct TextFields: View {
    @StateObject var registerViewModel: RegisterViewModel
    var body: some View {
        Group {
            AuthTextFieldView(placeholder: Text(LocaleKeys.Register.fullname.rawValue.locale())
                .foregroundColor(.colorHintText)
                .font(.system(size: 16.0, weight: .semibold)),
                text: $registerViewModel.fullNameText)
                .modifier(TextFieldModifier())
                .padding(.bottom, 5.0)

            AuthTextFieldView(placeholder: Text(LocaleKeys.Register.registerEmail.rawValue.locale())
                .foregroundColor(.colorHintText)
                .font(.system(size: 16.0, weight: .semibold)),
                text: $registerViewModel.emailText)
                .modifier(TextFieldModifier())
                .padding(.bottom, 5.0)

            SecureTextFieldView(text: $registerViewModel.passwordText, placeholder: Text(LocaleKeys.Register.registerPassword.rawValue.locale())
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
