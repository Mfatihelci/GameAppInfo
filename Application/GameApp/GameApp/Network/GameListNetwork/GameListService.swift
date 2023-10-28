//
//  GameListService.swift
//  GameApp
//
//  Created by muhammed fatih elçi on 17.10.2023.
//

import Foundation
import Alamofire

protocol GameListServiceProtocol {
    func FetchAllDatas(onsucces: @escaping ([Result]?) -> Void, onfail: @escaping (String) -> Void)
}

class GameListService: GameListServiceProtocol {
    func FetchAllDatas(onsucces: @escaping ([Result]?) -> Void, onfail: @escaping (String) -> Void) {
        AF.request(NetworkConstant.ServiceEndPoint.gamelist(), method: .get).validate().responseDecodable(of: Welcome.self) { model in
            guard let data = model.value else {
                onfail(model.debugDescription)
                return
            }
            let dataTwo = data.results
            onsucces(dataTwo)
        }
    }
}
