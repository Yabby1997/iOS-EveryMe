//
//  Appearances.swift
//  EveryMe
//
//  Created by Seunghun Yang on 2022/01/11.
//

import UIKit

enum Appearances {
    static let transparentNavigationBar: UINavigationBarAppearance = {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 20, weight: .bold)]
        appearance.shadowColor = .clear
        return appearance
    }()
}
