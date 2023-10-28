//
//  GameDetailViewModel.swift
//  GameApp
//
//  Created by muhammed fatih elçi on 20.10.2023.
//

import Foundation
import Alamofire

class DetailPageViewModel {
    
    var id: Int?
    var service: GameDetailServiceProtocol?
    var delegate: DetailPageViewModelDelegate?
    init(id: Int?, service: GameDetailServiceProtocol?) {
        self.id = id
        self.service = service
    }
}

extension DetailPageViewModel: DetailPageViewModelProtocol {
    func load() {
        guard let gameID = id else { return }
        service?.fetchAllData(path: gameID, onSucces: { game in
            self.delegate?.handleOutPut(game)
        }, onError: { error in
            print(error.debugDescription)
        })
    }
}
