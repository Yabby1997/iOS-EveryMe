//
//  AppCoordinator.swift
//  EveryMe
//
//  Created by Seunghun Yang on 2022/01/07.
//

import UIKit

class AppCoordinator: AnyCoordinator {
    func start() {
        let sceneIdentifier = UUID()
        let photoListViewCoordinator = PhotoListViewCoordinator(
            sceneIdentifier: sceneIdentifier,
            presenter: self.presenter,
            parent: self
        )
        
        guard let navigationController = self.presenter as? UINavigationController else { return }
        navigationController.navigationBar.standardAppearance = Appearances.transparentNavigationBar
        navigationController.navigationBar.scrollEdgeAppearance = Appearances.transparentNavigationBar
        
        self.children[sceneIdentifier] = photoListViewCoordinator
        photoListViewCoordinator.start()
    }
}
