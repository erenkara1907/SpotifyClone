//
//  CustomTabView.swift
//  SpotifyClone
//
//  Created by Eren Kara on 30.11.2022.
//

import SwiftUI

struct CustomTabView<Content: View>: View {
    let tabs: [TabItemModel]
    @Binding var selectedIndex: Int
    @ViewBuilder let content: (Int) -> Content

    var body: some View {
        ZStack {
            TabView(selection: $selectedIndex) {
                ForEach(tabs.indices, id: \.self) { index in
                    content(index)
                        .tag(index)
                }
            } // TabView

            VStack {
                Spacer()
                TabBottomView(tabbarItems: tabs, selectedIndex: $selectedIndex)
            } // VStack
        } // ZStack
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(tabs: TabType.allCases.map { $0.tabItem }, selectedIndex: .constant(0)) { _ in
            Text("Favorite")
        }
    }

    @ViewBuilder
    func getTabView(type: TabType) -> some View {
        switch type {
        case .home:
            HomeView()
        case .discovery:
            Text("Discovery")
        case .favorite:
            Text("Favorite")
        case .profile:
            Text("Profile")
        }
    }
}
