//
//  DetailView.swift
//  SpotifyClone
//
//  Created by Eren Kara on 5.12.2022.
//

import SwiftUI

struct DetailView: View {
    let model: ArtistModel
    @StateObject var detailViewModel: DetailViewModel = .init()

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    Color.colorAppBackground
                    VStack(alignment: .leading, spacing: 0.0) {
                        DetailTopView(detailViewModel: detailViewModel, geometry: geometry)

                        Image(model.thumbnail)
                            .resizable()
                            .frame(width: 335.0, height: 370.0)
                            .padding(.top, 26.0)

                        DetailContent(model: model)
                        DetailSlider(paddingTop: 42.0)
                        ActionButtons(paddingTop: 46.0)

                        HStack {
                            Spacer()
                            VStack(spacing: 0.0) {
                                AppleIcons.ArrowIcons.backward.rawValue.icon()
                                    .rotationEffect(.degrees(90.0))
                                    .foregroundColor(.colorDescription)
                                    .padding(.bottom, 3.0)

                                Text(LocaleKeys.Detail.lyrics.rawValue.locale())
                                    .modifier(TitleModifier(fontSize: 14.0))
                            } // VStack
                            Spacer()
                        } // HStack
                        .padding(.top, 33.0)
                        .onTapGesture {
                            detailViewModel.isFullScreen = true
                        }

                        Spacer()
                    } // VStack
                    .padding(.horizontal, 27.0)
                } // ZStack
            } // GeometryReader
            .ignoresSafeArea()
            .navigationDestination(isPresented: $detailViewModel.isRedirectToBack) {
                PagesView()
                    .navigationBarBackButtonHidden()
            }
            .fullScreenCover(isPresented: $detailViewModel.isFullScreen) {
                GeometryReader { geometry in
                    ZStack(alignment: .bottom) {
                        VStack {
                            FullScreenWords(model: model, geometry: geometry, viewModel: detailViewModel)
                            ZStack {
                                Color.colorAppBackground
                                VStack(alignment: .leading, spacing: 0.0) {
                                    FullScreenSongContent(model: model)
                                    DetailSlider(paddingTop: 20.0)
                                    ActionButtons(paddingTop: 11.0)
                                    Spacer()
                                } // VStack
                                .padding(.horizontal, 31.0)
                                .padding(.vertical, 13.0)
                            } // ZStack
                            .frame(width: .infinity, height: geometry.dynamicHeight(height: 0.3))
                        }
                    } // ZStack
                    .background(
                        Image(model.thumbnail)
                            .resizable()
                            .scaledToFill()
                    )
                    .ignoresSafeArea()
                }
            }
        } // NavigationStack
    }
}

struct ProgressViewExample: View {
    @State private var progress = 0.5
    var body: some View {
        VStack {
            Spacer()

            Spacer()
            Slider(value: $progress, in: 0 ... 1)
        }.tint(.orange).padding()
    }
}

struct ProgressStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            ProgressView(configuration)

            Circle()
                .frame(width: 16.0, height: 16.0)
                .padding(.leading, 2.25 * 4.02)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(model: ArtistModel(thumbnail: ImageItems.Home.badGuy.rawValue, songName: "asd", artistName: "asd"))
    }
}

private struct DetailTopView: View {
    @ObservedObject var detailViewModel: DetailViewModel
    let geometry: GeometryProxy

    var body: some View {
        HStack {
            ZStack(alignment: .center) {
                Circle()
                    .frame(width: 32.0, height: 32.0)
                    .foregroundColor(.colorSecondary)

                AppleIcons.ArrowIcons.backward.rawValue.icon()
                    .resizable()
                    .frame(width: 5.5, height: 11.5)
                    .foregroundColor(.colorIcon)
            } // ZStack
            .onTapGesture {
                detailViewModel.isRedirectToBack = true
            }

            Spacer()

            Text(LocaleKeys.Detail.nowPlaying.rawValue.locale())
                .modifier(TitleModifier(fontSize: 18.0))

            Spacer()

            AppleIcons.MenuIcons.ellipsis.rawValue.icon()
                .resizable()
                .frame(width: 20.0, height: 5.0)
                .foregroundColor(.colorIcon)
                .rotationEffect(.degrees(-90.0))
        } // HStack
        .padding(.top, device.size() ? geometry.topPadding() : 0.0)
    }
}

private struct DetailContent: View {
    let model: ArtistModel

    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(model.songName)
                    .modifier(TitleModifier(fontSize: 20.0))
                    .padding(.bottom, 1.0)

                Text(model.artistName)
                    .modifier(DescriptionModifier(fontSize: 20.0))
            } // VStack

            Spacer()

            AppleIcons.OtherIcons.heart.rawValue.icon()
                .resizable()
                .frame(width: 26.0, height: 24.0)
                .foregroundColor(.colorDescription)
        } // HStack
        .padding(.top, 17.0)
    }
}

private struct DetailSlider: View {
    let paddingTop: Double

    var body: some View {
        Group {
            Slider(value: .constant(2.25), in: 0 ... 4.02)
                .tint(.colorIcon)
                .padding(.top, paddingTop)
            HStack {
                Text("2:25")
                    .modifier(DescriptionModifier(fontSize: 12.0))
                Spacer()
                Text("4:02")
                    .modifier(DescriptionModifier(fontSize: 12.0))
            } // HStack
        }
    }
}

private struct ActionButtons: View {
    let paddingTop: Double

    var body: some View {
        HStack {
            Spacer()

            ImageItems.Detail.icRepeate.rawValue.image()
                .padding(.trailing, 29.0)

            ImageItems.Detail.icPrevious.rawValue.image()

            ZStack(alignment: .center) {
                Circle()
                    .frame(width: 72.0, height: 72.0)
                    .foregroundColor(.colorButton)

                ImageItems.Detail.icPause.rawValue.image()
            } // ZStack
            .padding(.horizontal, 17.0)

            ImageItems.Detail.icNext.rawValue.image()
            ImageItems.Detail.icShuffle.rawValue.image()
                .padding(.leading, 29.0)

            Spacer()
        } // HStack
        .padding(.top, paddingTop)
    }
}

struct FullScreenTop: View {
    @ObservedObject var viewModel: DetailViewModel
    let model: ArtistModel
    let geometry: GeometryProxy

    var body: some View {
        HStack {
            ZStack(alignment: .center) {
                Circle()
                    .frame(width: 32.0, height: 32.0)
                    .foregroundColor(.black.opacity(0.5))

                AppleIcons.ArrowIcons.backward.rawValue.icon()
                    .resizable()
                    .frame(width: 5.5, height: 11.5)
                    .foregroundColor(.white)
            } // ZStack
            .onTapGesture {
                viewModel.isFullScreen = false
            }

            Spacer()

            Text(model.songName)
                .modifier(TitleModifier(fontSize: 20.0))

            Spacer()

            AppleIcons.MenuIcons.ellipsis.rawValue.icon()
                .resizable()
                .frame(width: 20.0, height: 5.0)
                .foregroundColor(.colorIcon)
                .rotationEffect(.degrees(-90.0))
        } // HStack
        .padding(.top, geometry.topPadding())
    }
}

struct FullScreenWords: View {
    let model: ArtistModel
    let geometry: GeometryProxy

    @ObservedObject var viewModel: DetailViewModel

    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 0.0) {
                FullScreenTop(viewModel: viewModel, model: model, geometry: geometry)
                Text("(Verse 1)")
                    .modifier(TitleModifier(fontSize: 15.0))
                    .padding(.top, 26.0)

                Text("Sleepin', you're on your tippy toes Creepin' around like no one knows Think you're so criminal Bruises on both my knees for you Don't say thank you or please I do what I want when I'm wanting to")
                    .multilineTextAlignment(.leading)
                    .lineSpacing(25.0)
                    .modifier(DescriptionModifier(fontSize: 16.0))
                    .padding(.horizontal, 25.0)
                    .padding(.top, 23.0)

                Text("(Verse 2)")
                    .modifier(TitleModifier(fontSize: 15.0))
                    .padding(.top, 26.0)

                Text("Sleepin', you're on your tippy toes Creepin' around like no one knows Think you're so criminal Bruises on both my knees for you Don't say thank you or please I do what I want when I'm wanting to")
                    .multilineTextAlignment(.leading)
                    .lineSpacing(25.0)
                    .modifier(DescriptionModifier(fontSize: 16.0))
                    .padding(.horizontal, 25.0)
                    .padding(.top, 23.0)
                Text("Sleepin', you're on your tippy toes Creepin' around like no one knows Think you're so criminal Bruises on both my knees for you Don't say thank you or please I do what I want when I'm wanting to")
                    .multilineTextAlignment(.leading)
                    .lineSpacing(25.0)
                    .modifier(DescriptionModifier(fontSize: 16.0))
                    .padding(.horizontal, 25.0)
                    .padding(.top, 23.0)
            } // VStack
            .padding(.horizontal, 30.0)
        } // ScrollView
    }
}

struct FullScreenSongContent: View {
    let model: ArtistModel

    var body: some View {
        HStack(spacing: 0.0) {
            Image(model.thumbnail)
                .resizable()
                .frame(width: 42.0, height: 42.0)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 0.0) {
                Text(model.songName)
                    .modifier(TitleModifier(fontSize: 16.0))
                    .padding(.bottom, 5.0)

                Text(model.artistName)
                    .modifier(DescriptionModifier(fontSize: 12.0))
            }
            .padding(.leading, 15.0)

            Spacer()

            AppleIcons.OtherIcons.heart.rawValue.icon()
                .resizable()
                .frame(width: 24.0, height: 24.0)
                .foregroundColor(.colorDescription)
        }
    }
}
