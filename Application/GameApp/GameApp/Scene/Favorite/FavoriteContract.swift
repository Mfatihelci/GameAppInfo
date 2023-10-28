//
//  FavoriteContract.swift
//  GameApp
//
//  Created by muhammed fatih elçi on 26.10.2023.
//

import Foundation

//MARK: - ViewModel
protocol FavoriteViewModelProtocol {
    var favoriteDelegate: FavoriteViewModelDelegate? { get set }
    func load()
}

enum FavoriteViewModelOutPut  {
    case showlist([Result])
}

protocol FavoriteViewModelDelegate {
    func handleOutPut(_ value: FavoriteViewModelOutPut)
}

//MARK: - FavoriteProvider
protocol FavoriteProviderProtocol {
    func update(value: [Result])
}
