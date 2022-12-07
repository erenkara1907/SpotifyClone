//
//  TabBarView.swift
//  SpotifyClone
//
//  Created by Eren Kara on 2.12.2022.
//

import SwiftUI

struct Tab: View {
    @StateObject var homeViewModel: HomeViewModel
    var category: Int
    let model: CategoryModel

    var body: some View {
        Button {
            homeViewModel.selectedTab = category
        } label: {
            if category == (CategoryModel.categories.count - 1) {
                VStack(alignment: .center, spacing: 0.0) {
                    if homeViewModel.selectedTab == category {
                        Text(model.text.locale())
                            .modifier(TitleModifier(fontSize: 20.0))

                        Rectangle()
                            .frame(width: 26.0, height: 3.0)
                            .foregroundColor(.colorButton)
                            .cornerRadius(60.0, corners: .bottomLeft)
                            .cornerRadius(60.0, corners: .bottomRight)
                    } else {
                        Text(model.text.locale())
                            .modifier(TitleModifier(fontSize: 20.0))
                            .opacity(0.4)
                    }
                } // VStack
            } else {
                VStack(alignment: .center, spacing: 0.0) {
                    if homeViewModel.selectedTab == category {
                        Text(model.text.locale())
                            .modifier(TitleModifier(fontSize: 20.0))

                        Rectangle()
                            .frame(width: 26.0, height: 3.0)
                            .foregroundColor(.colorButton)
                            .cornerRadius(60.0, corners: .bottomLeft)
                            .cornerRadius(60.0, corners: .bottomRight)
                    } else {
                        Text(model.text.locale())
                            .modifier(TitleModifier(fontSize: 20.0))
                            .opacity(0.4)
                    }
                } // VStack
                .padding(.trailing, 37.0)
            }
        }
    }
}

struct TabBarView: View {
    @StateObject var homeViewModel: HomeViewModel

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0 ... CategoryModel.categories.count - 1, id: \.self) { category in
                        Tab(homeViewModel: homeViewModel, category: category, model: CategoryModel.categories[category])
                    } // ForEach
                } // HStack
                .onChange(of: homeViewModel.selectedTab) { newValue in
                    withAnimation {
                        proxy.scrollTo(newValue, anchor: .center)
                    }
                } // onChange
            } // ScrollView
        } // ScrollViewReader
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(homeViewModel: HomeViewModel())
            .previewLayout(.sizeThatFits)
    }
}
