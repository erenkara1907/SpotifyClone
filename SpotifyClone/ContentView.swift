//
//  ContentView.swift
//  SpotifyClone
//
//  Created by Eren Kara on 25.11.2022.
//

import SwiftUI

struct ContentView: View {
    @State var endSplash = false
    @State var animate = false

    func animateSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.55) {
            withAnimation(.easeIn(duration: 0.55)) {
                animate.toggle()
            }

            withAnimation(.easeOut(duration: 0.45)) {
                endSplash.toggle()
            }
        }
    }

    var body: some View {
        ZStack {
            OnboardView()
                .preferredColorScheme(.dark)

            SplashView()
                .onAppear(perform: animateSplash)
                .opacity(endSplash ? 0.0 : 1.0)
        } // ZStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
