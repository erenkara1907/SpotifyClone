//
//  OnboardView.swift
//  SpotifyClone
//
//  Created by Eren Kara on 25.11.2022.
//

import SwiftUI

struct OnboardView: View {
    @State private var isActive: Bool = false
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    ImageItems.Authentication.arianaGrande.rawValue.image()
                        .resizable()
                    
                    VStack {
                        ImageItems.App.appLogo.rawValue.image()
                            .padding(.top, 55.0)
                        Spacer()
                        
                        Texts()
                            .padding(.horizontal, 53.0)
                        
                        NavigationLink(isActive: $isActive) {
                            ContentView(endSplash: true)
                        } label: {
                            Button {
                                
                            } label: {
                                Text("Get Started")
                                    .modifier(ButtonTextModifier(fontSize: 22.0))
                            }
                        } // Button
                        .padding(.horizontal, 53.0)
                        .frame(width: 329.0, height: 92.0)
                        .background(Color.colorButton)
                        .cornerRadius(30.0)
                        .padding(.bottom, 69.0)

                        
                    } // VStack
                } // ZStack
                .ignoresSafeArea()
            }
        } // NavigationView
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
            Text(LocaleKeys.Authentication.onboardTitle.rawValue.locale())
                .modifier(TitleModifier(fontSize: 25.0))
                .padding(.bottom, 21.0)
                .multilineTextAlignment(.center)
            
            Text(LocaleKeys.Authentication.onboardContent.rawValue.locale())
                .modifier(DescriptionModifier(fontSize: 17.0))
                .padding(.bottom, 37.0)
        }
    }
}
