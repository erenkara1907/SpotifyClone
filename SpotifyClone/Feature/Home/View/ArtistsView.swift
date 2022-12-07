//
//  ArtistsView.swift
//  SpotifyClone
//
//  Created by Eren Kara on 2.12.2022.
//

import SwiftUI

struct ArtistsView: View {
    @ObservedObject var homeViewModel: HomeViewModel

    var body: some View {
        NavigationStack {
            ScrollViewReader { _ in
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0 ... ArtistModel.artists.count - 1, id: \.self) { artist in
                            NavigationLink {
                                DetailView(model: ArtistModel.artists[artist])
                                    .navigationBarBackButtonHidden()
                            } label: {
                                ArtistCard(model: ArtistModel.artists[artist])
                            }
                        } // ForEach
                    } // HStack
                } // Scroll View
            } // ScrollViewReader
            .padding(.top, 28.0)
        } // NavigationStack
    }
}

struct ArtistsView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistsView(homeViewModel: HomeViewModel())
    }
}
