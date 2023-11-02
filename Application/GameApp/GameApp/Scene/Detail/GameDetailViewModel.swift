//
//  GameDetailViewModel.swift
//  GameApp
//
//  Created by muhammed fatih elçi on 20.10.2023.
//

import Foundation
import Alamofire
import CoreData

class DetailPageViewModel {
    
    var id: Int?
    var favoriteGame: Result?
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
    
    func save() {
        print("faith")
        let context = appDelegate.persistentContainer.viewContext
        let newData = NSEntityDescription.insertNewObject(forEntityName: "GameFavorite", into: context)
        
        newData.setValue(favoriteGame?.name, forKey: "name")
        newData.setValue(favoriteGame?.rating, forKey: "released")
        newData.setValue(favoriteGame?.rating, forKey: "rating")
        newData.setValue(favoriteGame?.backgroundImage, forKey: "backgroundImage")
        do {
            try context.save()
            print("success")
        } catch {
            print(error)
        }

    }
    
}
