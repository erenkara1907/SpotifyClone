//
//  FavoriteView.swift
//  SpotifyClone
//
//  Created by Eren Kara on 6.12.2022.
//

import SwiftUI

struct FavoriteView: View {
    
    @State var initialOffset: CGFloat?
    @State var offset: CGFloat?
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 0.0) {
                HeaderView(geometry: geometry)
                ScrollView {
                    VStack(alignment: .leading, spacing: 0.0) {
                        Text(LocaleKeys.Favorite.publicPlay.rawValue.uppercased().locale())
                            .modifier(TitleModifier(fontSize: 15.0))
                            .padding(.bottom, 17.0)
                        
                        ForEach((0...FavoriteSong.favoriteSongs.count - 1), id: \.self) { favorite in
                            FavoriteCard(model: FavoriteSong.favoriteSongs[favorite], geometry: geometry)
                        } // ForEach
                    } // VStack
                    .padding(.top, 19.0)
                    .padding(.horizontal, 29.0)
                } // ScrollView
            } // VStack
            .padding(.bottom, 75.0)
            .background(Color.colorAppBackground)
        } // GeometryReader
        .ignoresSafeArea()
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}

private struct HeaderView: View {
    
    let model: PersonModel = PersonModel()
    let geometry: GeometryProxy
    
    var body: some View {
        VStack(alignment: .center,spacing: 0.0) {
            // header
            HStack(alignment: .center, spacing: 0.0) {
                BackButton {}
                Spacer()
                Text(LocaleKeys.Favorite.profile.rawValue.locale())
                Spacer()
                MenuIcon(color: .colorBackButton)
            } // HStack
            .padding(.bottom, 20.0)
            
            Group {
                Image(model.profilePhoto)
                    .resizable()
                    .frame(width: 93.0, height: 93.0)
                    .clipShape(Circle())
                    .padding(.bottom, 11.0)
                
                Text(model.email)
                    .modifier(DescriptionModifier(fontSize: 12.0))
                    .padding(.bottom, 8.0)
                
                Text(model.username)
                    .modifier(TitleModifier(fontSize: 20.0))
                    .padding(.bottom, 18.0)
                
                HStack {
                    VStack(spacing: 0.0) {
                        Text("778")
                            .modifier(TitleModifier(fontSize: 20.0))
                        
                        Text(LocaleKeys.Favorite.follower.rawValue.locale())
                            .modifier(DescriptionModifier(fontSize: 14.0))
                    } // VStack
                    
                    Spacer()
                    
                    VStack(spacing: 0.0) {
                        Text("243")
                            .modifier(TitleModifier(fontSize: 20.0))
                        
                        Text(LocaleKeys.Favorite.follow.rawValue.locale())
                            .modifier(DescriptionModifier(fontSize: 14.0))
                    } // VStack
                } // HStack
                .padding(.horizontal, 60.0)
                .padding(.bottom, 21.0)
            } // Group
        } // VStack
        .padding(.top, geometry.topPadding())
        .padding(.horizontal, 29.0)
        .background(Color.colorSecondary)
        .animation(.linear)
    }
}

private struct FavoriteCard: View {
    
    let model: FavoriteSong
    let geometry: GeometryProxy
    
    var body: some View {
        HStack(alignment: .center, spacing: 0.0) {
            Group {
                Image(model.thumbnail)
                    .resizable()
                    .frame(width: 58.0, height: 56.0)
                    .cornerRadius(14.0)
                    .padding(.trailing, 20.0)
                
                VStack(alignment: .leading, spacing: 0.0) {
                    Text(model.songName)
                        .multilineTextAlignment(.leading)
                        .modifier(TitleModifier(fontSize: 16.0))
                        .padding(.bottom, 5.0)
                    
                    Text(model.artistName)
                        .multilineTextAlignment(.leading)
                        .modifier(DescriptionModifier(fontSize: 12.0))
                } // VStack
                .frame(width: geometry.dynamicWidth(width: 0.4), height: 50.0, alignment: .leading)
            } // Group
            
            Spacer()
            
            Text("5:33")
                .modifier(TitleModifier(fontSize: 15.0))
                .padding(.trailing, 37.0)
            
            AppleIcons.MenuIcons.ellipsis.rawValue.icon()
                .foregroundColor(.colorTitle)
        }
        .padding(.bottom, 10.0)
    }
}
