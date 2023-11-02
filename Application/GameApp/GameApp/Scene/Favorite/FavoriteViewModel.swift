//
//  FavoriteViewModel.swift
//  GameApp
//
//  Created by muhammed fatih elçi on 26.10.2023.
//

import UIKit
import CoreData

class FavoriteListViewModel: FavoriteViewModelProtocol {
    func fetchDataCount() -> Int {
        gameFavorite.count
    }
    
    var favoriteDelegate: FavoriteViewModelDelegate?
    var gameFavorite: [GameFavorite] = []

    var nameArray:[GameFavorite] = []
    
    func fetchData() -> [GameFavorite] {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GameFavorite")
//        fetchRequest.returnsObjectsAsFaults = false
//
        do{
            let results = try context.fetch(GameFavorite.fetchRequest())
            gameFavorite = results
//            for result in results as! [NSManagedObject]{
//                if let name = result.value(forKey: "name") as? String {
//                }
//                if let id = result.value(forKey: "id") as? UUID {
//                    self.idArray.append(id)
//                }
//            }
        } catch {
            
        }
        return gameFavorite
    }
    
}
