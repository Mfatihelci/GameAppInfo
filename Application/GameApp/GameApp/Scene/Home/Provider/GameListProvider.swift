//
//  GameListProvider.swift
//  GameApp
//
//  Created by muhammed fatih elçi on 23.10.2023.
//

import UIKit
import Alamofire

 class GameListProvider: NSObject {
    var gameList: [Result] = []
     var delegate: CollectionViewDelegate?
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        //let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let adjustedWith = collectionViewWidth
        let width: CGFloat = floor(adjustedWith)
        let height: CGFloat = 125
        return CGSize(width: width, height: height)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dataTwo = gameList[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameListCollectionViewCell.Identifier.path.rawValue, for: indexPath) as? GameListCollectionViewCell else { return UICollectionViewCell()
        }
        let rowAsString = "\(indexPath.row + 1)"
        cell.yaz(value: rowAsString)
        cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.cornerRadius = 12
        cell.clipsToBounds = true
        cell.saveModel(value: dataTwo)
        return cell
    }
     
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         DispatchQueue.main.async {
             let selectData = self.gameList[indexPath.row].id
             self.delegate?.onSelected(at: selectData)
         }
     }

}

extension GameListProvider: GameListProviderProtocol {
    func update(value: [Result]) {
        let data = value
        gameList = data
    }
}
extension GameListProvider: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource { }

