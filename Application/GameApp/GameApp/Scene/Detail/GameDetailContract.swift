//
//  GameDetailContract.swift
//  GameApp
//
//  Created by muhammed fatih elçi on 20.10.2023.
//

import Foundation

//MARK: - ViewModel
protocol DetailPageViewModelProtocol {
    var delegate: DetailPageViewModelDelegate? { get set}
    func load()
}

protocol DetailPageViewModelDelegate {
    func handleOutPut(_ value: GameDetailResult)
}


