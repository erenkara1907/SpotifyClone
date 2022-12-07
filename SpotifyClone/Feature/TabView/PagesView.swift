//
//  PagesView.swift
//  SpotifyClone
//
//  Created by Eren Kara on 30.11.2022.
//

import SwiftUI

struct PagesView: View {
    @State private var selectedIndex: Int = 0

    var body: some View {
        CustomTabView(tabs: TabType.allCases.map { $0.tabItem }, selectedIndex: $selectedIndex) { index in
            let type = TabType(rawValue: index) ?? .home
            getTabView(type: type)
        }
        .ignoresSafeArea()
    }

    @ViewBuilder
    func getTabView(type: TabType) -> some View {
        switch type {
        case .home:
            HomeView()
        case .discovery:
            Text("Discovery")
        case .favorite:
            FavoriteView()
        case .profile:
            Text("Profile")
        }
    }
}

struct PagesView_Previews: PreviewProvider {
    static var previews: some View {
        PagesView()
    }
}
