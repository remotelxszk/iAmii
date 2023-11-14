//
//  SceneDelegate.swift
//  iAmii
//
//  Created by Dominik Leszczyński on 21/10/2023.
//

import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(
            rootView: ListSeriesView(viewModel: .init())
        )
        window.backgroundColor = .systemBackground
        self.window = window
        window.makeKeyAndVisible()
    }
}
