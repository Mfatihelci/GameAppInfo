//
//  GameDetailService.swift
//  GameApp
//
//  Created by muhammed fatih elçi on 17.10.2023.
//

import Foundation
import Alamofire

protocol GameDetailServiceProtocol {
    func fetchAllData(
        path:Int,
        onSucces: @escaping (GameDetailResult) -> Void,
        onError: @escaping (String) -> Void
    )
}

class GameDetailService: GameDetailServiceProtocol {
    func fetchAllData(path: Int, onSucces: @escaping (GameDetailResult) -> Void, onError: @escaping (String) -> Void) {
        AF.request(NetworkConstant.GameDetailNetwork.gameDetail(path: path),method: .get).responseDecodable(of: GameDetailResult.self) { game in
            guard let data = game.value else {
                return onError("hata")
            }
            onSucces(data)
        }
    }
}
