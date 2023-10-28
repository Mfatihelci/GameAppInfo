//
//  GameDetailBulder.swift
//  GameApp
//
//  Created by muhammed fatih elçi on 21.10.2023.
//

import Foundation

final class GameDetailBuilder {
    static func make(ID: Int) -> GameDetailViewController {
        let view = GameDetailViewController()
        let viewModel = DetailPageViewModel(id: ID, service: GameDetailService())
        view.viewModel = viewModel
        return view
    }
}
