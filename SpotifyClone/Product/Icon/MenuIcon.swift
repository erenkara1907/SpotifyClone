//
//  MenuIcon.swift
//  SpotifyClone
//
//  Created by Eren Kara on 6.12.2022.
//

import SwiftUI

struct MenuIcon: View {
    
    let color: Color
    
    var body: some View {
        AppleIcons.MenuIcons.ellipsis.rawValue.icon()
            .resizable()
            .frame(width: 20.0, height: 5.0)
            .foregroundColor(.colorIcon)
            .rotationEffect(.degrees(-90.0))
    }
}

struct MenuIcon_Previews: PreviewProvider {
    static var previews: some View {
        MenuIcon(color: .colorBackButton)
    }
}
