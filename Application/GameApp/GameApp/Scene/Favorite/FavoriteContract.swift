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
    func fetchData() -> [GameFavorite]
    func fetchDataCount() -> Int
}

protocol FavoriteViewModelDelegate {
    func handleOutPut(_ value: Result)
}

//MARK: - FavoriteProvider
protocol FavoriteProviderProtocol {
    func update(value: [GameFavorite])
}
