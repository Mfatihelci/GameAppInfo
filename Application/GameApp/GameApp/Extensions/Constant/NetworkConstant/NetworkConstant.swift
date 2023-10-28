//
//  NetworkConstant.swift
//  GameApp
//
//  Created by muhammed fatih elçi on 20.10.2023.
//

import Foundation

final class NetworkConstant {
    enum ServiceEndPoint: String {
        case path_url = "https://api.rawg.io/api"
        case game_url = "/games?"
        case key = "key=c85efa6050f7465e8c82c3921926104d"
        //URL = "https://api.rawg.io/api/games?key=c85efa6050f7465e8c82c3921926104d"
        
        static func gamelist() -> String {
            return "\(path_url.rawValue)\(game_url.rawValue)\(key.rawValue)"
            
        }
        
    }
    
    enum GameDetailNetwork: String {
        case path_url = "https://api.rawg.io/api"
        case game_url = "/games/"
        case key = "?key=c85efa6050f7465e8c82c3921926104d"
        //url = "https://api.rawg.io/api/games/3498?key=c85efa6050f7465e8c82c3921926104d"
        
        static func gameDetail(path: Int) -> String {
            return "\(path_url.rawValue)\(game_url.rawValue)\(path)\(key.rawValue)"
        }
    }
    
}
