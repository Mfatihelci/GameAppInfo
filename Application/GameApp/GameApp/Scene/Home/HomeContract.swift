//
//  HomeContract.swift
//  GameApp
//
//  Created by muhammed fatih elçi on 17.10.2023.
//

import Foundation

//MARK: - ViewModel
protocol ViewModelProtocol {
    var delegate: ViewModelDelegate? { get set }
    func load()
    func searchCharacter(key: String)
}

enum ViewModelOutPut {
    case showList([Result])
}

protocol ViewModelDelegate {
    func handleOutPut(_ output: ViewModelOutPut)
}

//MARK: - GameListProvider

protocol GameListProviderProtocol {
    var delegate: CollectionViewDelegate? { get set }
    func update(value: [Result])
}
protocol CollectionViewDelegate {
    func onSelected(at select: Int)
}

//MARK: - ImageListProvider
protocol ImageListProviderProtocol {
    func update(value: [Result])
}


