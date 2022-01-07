//
//  SceneDelegate.swift
//  EveryMe
//
//  Created by Seunghun Yang on 2022/01/07.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let rootViewController = UINavigationController()
        self.appCoordinator = AppCoordinator(sceneIdentifier: UUID(), presenter: rootViewController)
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = rootViewController
        self.window?.makeKeyAndVisible()
        
        self.appCoordinator?.start()
    }
}
