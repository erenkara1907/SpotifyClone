//
//  TabBottomView.swift
//  SpotifyClone
//
//  Created by Eren Kara on 30.11.2022.
//

import SwiftUI

struct TabBottomView: View {
    let tabbarItems: [TabItemModel]
    var height: CGFloat = 85.0
    var width: CGFloat = UIScreen.main.bounds.width
    @Binding var selectedIndex: Int

    var body: some View {
        HStack {
            Spacer()

            ForEach(tabbarItems.indices, id: \.self) { index in
                let item = tabbarItems[index]
                VStack {
                    if self.selectedIndex == index {
                        Group {
                            Rectangle()
                                .frame(width: 23.0, height: 4.0)
                                .foregroundColor(.colorButton)
                                .cornerRadius(160.0, corners: .bottomLeft)
                                .cornerRadius(160.0, corners: .bottomRight)
                                .padding(.bottom, 17.0)

                            Button {
                                self.selectedIndex = index
                            } label: {
                                let isSelected = selectedIndex == index
                                TabItemView(data: item, isSelected: isSelected)
                            } // Button

                            Spacer()
                        } // Group
                    } else {
                        Button {
                            self.selectedIndex = index
                        } label: {
                            let isSelected = selectedIndex == index
                            TabItemView(data: item, isSelected: isSelected)
                        } // Button
                    }
                } // VStack
                Spacer()
            } // ForEach
        } // HStack
        .frame(width: width, height: height)
        .background(Color.colorSecondary)
        .shadow(radius: 5.0, x: 0.0, y: 4.0)
    }
}

struct TabBottomView_Previews: PreviewProvider {
    static var previews: some View {
        TabBottomView(tabbarItems: [
            TabItemModel(image: ImageItems.App.home.rawValue, selectedImage: ImageItems.App.homeFill.rawValue),
            TabItemModel(image: ImageItems.App.discovery.rawValue, selectedImage: ImageItems.App.discoveryFill.rawValue),
            TabItemModel(image: ImageItems.App.heart.rawValue, selectedImage: ImageItems.App.heartFill.rawValue),
            TabItemModel(image: ImageItems.App.profile.rawValue, selectedImage: ImageItems.App.profileFill.rawValue),
        ], selectedIndex: .constant(1))
            .previewLayout(.sizeThatFits)
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
