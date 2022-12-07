//
//  TabItemView.swift
//  SpotifyClone
//
//  Created by Eren Kara on 30.11.2022.
//

import SwiftUI

struct TabItemView: View {
    let data: TabItemModel
    let isSelected: Bool

    var body: some View {
        VStack {
            if isSelected {
                Image(systemName: data.selectedImage)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.colorButton)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28.0, height: 28.0)
                    .animation(Animation.default, value: 100.0)
            } else {
                Image(systemName: data.image)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.colorHintText)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28.0, height: 28.0)
                    .animation(Animation.default, value: 100.0)
            }
        } // VStack
    }
}

struct TabItemView_Previews: PreviewProvider {
    static var previews: some View {
        TabItemView(data: TabItemModel(image: ImageItems.App.home.rawValue, selectedImage: ImageItems.App.homeFill.rawValue), isSelected: false)
            .previewLayout(.sizeThatFits)
    }
}
