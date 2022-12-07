//
//  HomeView.swift
//  SpotifyClone
//
//  Created by Eren Kara on 30.11.2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var homeViewModel: HomeViewModel = .init()

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.colorAppBackground
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        if device.size() {
                            TopView()
                                .padding(.top, geometry.topPadding())
                                .padding(.horizontal, geometry.dynamicWidth(width: 0.05))
                        } else {
                            TopView()
                                .padding(.horizontal, geometry.dynamicWidth(width: 0.05))
                        }

                        TabBarView(homeViewModel: homeViewModel)
                            .padding(.horizontal, geometry.dynamicWidth(width: 0.05))
                        ArtistsView(homeViewModel: homeViewModel)

                        HStack {
                            Text(LocaleKeys.Home.playlist.rawValue.locale())
                                .modifier(TitleModifier(fontSize: 20.0))
                            Spacer()
                            Text(LocaleKeys.Home.seeMore.rawValue.locale())
                                .modifier(DescriptionModifier(fontSize: 12.0))
                        } // HStack
                        .padding(.horizontal, geometry.dynamicWidth(width: 0.05))
                        .padding(.top, 37.0)

                        ForEach(0 ... PlaylistModel.playlists.count - 1, id: \.self) { playlist in
                            PlaylistCard(model: PlaylistModel.playlists[playlist])
                        }
                        .padding(.horizontal, geometry.dynamicWidth(width: 0.05))

                        Spacer()
                    } // VStack
                    .padding(.bottom, 85.0)
                } // ScrollView
            } // ZStack
            .ignoresSafeArea()
        } // GeometryRead
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
