//
//  SceneDelegate.swift
//  LiveVideoShoppingPlayer
//
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: BambuserWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = BambuserWindow(
            windowScene: scene,
            configuration: BambuserWindow.Configuration(
                size: CGSize(width: 150, height: 250),
                isDraggable: true))
        let navigationController = UINavigationController(rootViewController: HomeViewController(style: .insetGrouped))
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
