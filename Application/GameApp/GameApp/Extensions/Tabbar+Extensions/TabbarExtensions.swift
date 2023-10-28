//
//  TabbarExtensions.swift
//  GameApp
//
//  Created by muhammed fatih elçi on 18.10.2023.
//

import Foundation
import UIKit

//MARK: - Tabbar Setup Extensions

extension GameTabBarController: UITabBarControllerDelegate {
    func setupTabbar() {
        navigationItem.hidesBackButton = true
        self.tabBar.tintColor = .systemIndigo
        self.tabBar.backgroundColor = .white
        navigationItem.titleView?.isHidden = true
        navigationItem.hidesBackButton = true
        let VC1 = UINavigationController(rootViewController: GamelistBuilder.make())
        let VC2 = UINavigationController(rootViewController: FavoriteBuilder.make())
        self.setViewControllers([VC1, VC2], animated: true)
        guard let item = self.tabBar.items else { return }
        item[0].image = UIImage(systemName: "house.fill")
        item[1].image = UIImage(systemName: "heart.fill")
    }
}
