//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Oleg Stepanov on 22.03.2026.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        
        let feedVC    = FeedViewController()
        let profileVC = ProfileViewController()
        
        
        let feedNav    = UINavigationController(rootViewController: feedVC)
        let profileNav = UINavigationController(rootViewController: profileVC)
        
        
        feedNav.tabBarItem = UITabBarItem(
            title: "Лента",
            image: UIImage(systemName: "newspaper"),
            tag: 0
        )
        
        profileNav.tabBarItem = UITabBarItem(
            title: "Профиль",
            image: UIImage(systemName: "person.circle"),
            tag: 1
        )
        
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [feedNav, profileNav]
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}
