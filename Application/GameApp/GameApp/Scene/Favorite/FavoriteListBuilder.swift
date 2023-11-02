//
//  FavoriteListBuilder.swift
//  GameApp
//
//  Created by muhammed fatih elçi on 26.10.2023.
//

import Foundation

final class FavoriteBuilder {
    static func make() -> FavoriteViewController {
        let vc = FavoriteViewController()
        let viewModel = FavoriteListViewModel()
        vc.favoriViewModel = viewModel
        return vc
    }
}
