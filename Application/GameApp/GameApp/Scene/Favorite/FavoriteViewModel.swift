//
//  FavoriteViewModel.swift
//  GameApp
//
//  Created by muhammed fatih elçi on 26.10.2023.
//

import Foundation

class FavoriteListViewModel: FavoriteViewModelProtocol {
    var favoriteDelegate: FavoriteViewModelDelegate?
    var service: GameListServiceProtocol?
    
    init(service: GameListServiceProtocol?) {
        self.service = service
    }
    
    func load() {
        service?.FetchAllDatas(onsucces: { data in
            self.favoriteDelegate?.handleOutPut(.showlist(data ?? []))
        }, onfail: { error in
            print(error.debugDescription)
        })
    }
}
