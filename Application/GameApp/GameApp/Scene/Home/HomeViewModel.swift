//
//  HomeViewModel.swift
//  GameApp
//
//  Created by muhammed fatih elçi on 17.10.2023.
//

import Foundation
import Alamofire

class GameListViewModel: ViewModelProtocol {
   
    
    var delegate: ViewModelDelegate?
    private var service: GameListServiceProtocol?
    var gameList: [Result] = []
    
    init(service: GameListServiceProtocol) {
        self.service = service
    }
    func load() {
        service?.FetchAllDatas(onsucces: { model in
            self.delegate?.handleOutPut(.showList(model ?? []))
            self.gameList = model ?? []
        }, onfail: { data in
            print(data.debugDescription)
        })
    }
    
    func searchCharacter(key: String) {
        var characterList: [Result] = []
        gameList.forEach ({ item in
            if item.name.lowercased().contains(key.lowercased()) {
                characterList.append(item)
            }
        })
        delegate?.handleOutPut(.showList(characterList))
    }
    
}
