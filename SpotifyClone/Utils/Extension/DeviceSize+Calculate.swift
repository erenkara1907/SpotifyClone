//
//  DeviceSize.swift
//  SpotifyClone
//
//  Created by Eren Kara on 5.12.2022.
//

import SwiftUI

extension Bool {
    // MARK: - Functions

    func size() -> Bool {
        let sizeWidth = UIScreen.main.bounds.size.width
        let sizeHeight = UIScreen.main.bounds.size.height

        switch (sizeWidth, sizeHeight) {
        case (390.0, 844.0):
            return true
        case (428.0, 926.0):
            return true
        case (393.0, 852.0):
            return true
        case (430.0, 932.0):
            return true
        default:
            return false
        }
    }
}
