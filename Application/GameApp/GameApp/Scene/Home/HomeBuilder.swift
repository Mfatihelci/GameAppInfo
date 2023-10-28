//
//  HomeBuilder.swift
//  GameApp
//
//  Created by muhammed fatih elçi on 20.10.2023.
//

import Foundation

final class GamelistBuilder {
    static func make() -> HomeViewController {
        let vc = HomeViewController()
        let viewmodel = GameListViewModel(service: GameListService())
        vc.viewmodel = viewmodel
        return vc
    }
}
