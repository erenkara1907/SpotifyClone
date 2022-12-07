//
//  DenemeView.swift
//  SpotifyClone
//
//  Created by Eren Kara on 7.12.2022.
//

import SwiftUI

struct Album: Identifiable {
    let id = UUID().uuidString
    let albumName: String
    let albumImage: String
    var isLiked: Bool = false
}

var albums: [Album] = [
    Album(albumName: "Positions", albumImage: ImageItems.Home.badGuy.rawValue),
    Album(albumName: "The Best", albumImage: ImageItems.Home.badGuy.rawValue),
    Album(albumName: "My Everything", albumImage: ImageItems.Home.badGuy.rawValue),
    Album(albumName: "Yours Truly", albumImage: ImageItems.Home.badGuy.rawValue),
    Album(albumName: "Sweetener", albumImage: ImageItems.Home.badGuy.rawValue),
    Album(albumName: "Rain On Me", albumImage: ImageItems.Home.badGuy.rawValue),
    Album(albumName: "Stuck With U", albumImage: ImageItems.Home.badGuy.rawValue),
    Album(albumName: "7 rings", albumImage: ImageItems.Home.badGuy.rawValue),
    Album(albumName: "Bang Bang ", albumImage: ImageItems.Home.badGuy.rawValue),
]

struct OffsetModifier: ViewModifier {
    
    @Binding var offset: CGFloat
    
    // Optional to return value from 0.0
    var returnFromStart: Bool = true
    @State var startValue: CGFloat = 0.0
    
    func body(content: Content) -> some View {
        return content
            .overlay {
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: OffsetKey.self,value: proxy.frame(in: .named("SCROLL")).minY)
                        .onPreferenceChange(OffsetKey.self) { value in
                            if startValue == 0 {
                                startValue = value
                            }
                            
                            offset = (value - (returnFromStart ? startValue : 0.0))
                        }
                } // GeometryReader
            } // Overlay
    }
}

// MARK: - Preference Key
struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0.0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}


struct DenemeView: View {
    
    @State var currentType: String = "Popular"
    
    // MARK: - For Smooth Slliding Effect
    @Namespace var animation
    @State var _albums: [Album] = albums
    
    @State var headerOffsets: (CGFloat, CGFloat) = (0.0, 0.0)
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0.0) {
                HeaderView()
                
                // MARK: - Pinned Header with Content
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    Section {
                        SongList()
                    } header: {
                        PinnedHeaderView()
                            .background(.black)
                            .offset(y: headerOffsets.1 > 0 ? 0.0 : -headerOffsets.1 / 8)
                            .modifier(OffsetModifier(offset: $headerOffsets.0, returnFromStart: false))
                            .modifier(OffsetModifier(offset: $headerOffsets.1))
                    }
                    
                } // LazyVStack
            } // VStack
        } // ScrollView
        .overlay(content: {
                Rectangle()
                        .fill(.black)
                        .frame(height: 50.0)
                        .frame(maxHeight: .infinity, alignment: .top)
                    .opacity(headerOffsets.0 < 5.0 ? 1.0 : 0.0)
        })
        .coordinateSpace(name: "SCROLL")
        .ignoresSafeArea(.container, edges: .vertical)
    }
    
    // MARK: - Pinned Content
    @ViewBuilder
    func SongList() -> some View {
        VStack(spacing: 25.0) {
            ForEach($_albums) { $album in
                HStack(spacing: 12.0) {
                    
                    Text("#\(getIndex(album: album) + 1)")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    
                    Image(album.albumImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 55.0, height: 55.0)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                    
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text(album.albumName)
                            .fontWeight(.semibold)
                        
                        Label {
                            Text("65,587,909")
                        } icon: {
                            Image(systemName: "beats.headphones")
                                .foregroundColor(.white)
                        }
                        .foregroundColor(.gray)
                        .font(.caption)
                    } // VStack
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button {
                        album.isLiked.toggle()
                    } label: {
                        Image(systemName: album.isLiked ? "suit.heart.fill" : "suit.heart")
                            .font(.title3)
                            .foregroundColor(album.isLiked ? .green : .white)
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "ellipsis")
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                    
                } // HStack
            } // ForEach
        } // VStack
        .padding()
        .padding(.top, 25.0)
        .padding(.bottom, 150.0)
    }
    
    func getIndex(album: Album) -> Int {
        return _albums.firstIndex { currentAlbum in
            return album.id == currentAlbum.id
        } ?? 0
    }
    
    // MARK: - Header View
    @ViewBuilder
    func HeaderView() -> some View {
        GeometryReader { proxy in
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let size = proxy.size
            let height = (size.height + minY)
            
            ImageItems.App.dua.rawValue.image()
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: height > 0 ? height : 0.0, alignment: .top)
                .overlay(content: {
                    ZStack(alignment: .bottom) {
                        LinearGradient(colors: [
                            .clear,
                            .black.opacity(0.8)
                        ], startPoint: .top, endPoint: .bottom)
                        
                        VStack(alignment: .leading, spacing: 12.0) {
                            Text("ARTIST")
                                .font(.callout)
                                .foregroundColor(.gray)
                            
                            HStack(alignment: .bottom, spacing: 10.0) {
                                Text("Dua Lipa")
                                    .font(.title.bold())
                                
                                Image(systemName: "checkmark.seal.fill")
                                    .foregroundColor(.blue)
                                    .background {
                                        Circle()
                                            .fill(.white)
                                            .padding(3.0)
                                    }
                            } // HStack
                            
                            Label {
                                Text("Monthly Listeners")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white.opacity(0.7))
                            } icon: {
                                Text("62,354,659")
                                    .fontWeight(.semibold)
                            }
                            .font(.caption)
                            
                        } // VStack
                        .padding(.horizontal)
                        .padding(.bottom, 25.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    } // ZStack
                })
                .cornerRadius(15.0)
                .offset(y: -minY)
        } // GeometryReader
        .frame(height: 250.0)
    }
    
    // MARK: - Pinned Header
    @ViewBuilder
    func PinnedHeaderView() -> some View {
        let types: [String] = ["Popular","Albums","Songs","Fans also like","About"]
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 25.0) {
                ForEach(types, id: \.self) { type in
                    VStack(spacing: 12.0) {
                        Text(type)
                            .fontWeight(.semibold)
                            .foregroundColor(currentType == type ? .white : .gray)
                        
                        ZStack {
                            if currentType == type {
                                RoundedRectangle(cornerRadius: 4.0, style: .continuous)
                                    .fill(.white)
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            } else {
                                RoundedRectangle(cornerRadius: 4.0, style: .continuous)
                                    .fill(.clear)
                            }
                        } // ZStack
                        .padding(.horizontal, 8.0)
                        .frame(height: 4.0)
                    } // VStack
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            currentType = type
                        }
                    }
                } // ForEach
            } // HStack
            .padding(.horizontal)
            .padding(.top, 25.0)
            .padding(.bottom, 5.0)
        } // ScrollView
    }
}

struct DenemeView_Previews: PreviewProvider {
    static var previews: some View {
        DenemeView()
    }
}
