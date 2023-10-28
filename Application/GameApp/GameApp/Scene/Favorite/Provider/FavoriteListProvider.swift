//
//  FavoriteListProvider.swift
//  GameApp
//
//  Created by muhammed fatih elçi on 26.10.2023.
//

import UIKit
import Alamofire

 class FavoriteListProvider: NSObject {
     
     var favoriList: [Result] = []
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let adjustedWith = collectionViewWidth
        let width: CGFloat = floor(adjustedWith)
        let height: CGFloat = 125
        return CGSize(width: width, height: height)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dataList = favoriList[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteCollectionViewCell.Identifier.path.rawValue, for: indexPath) as? FavoriteCollectionViewCell else { return UICollectionViewCell()
        }
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.cornerRadius = 12
        cell.saveFavorite(value: dataList)
        let rowAsString = "\(indexPath.row + 1)"
        cell.number(value: rowAsString)
        cell.clipsToBounds = true
        return cell
    }
}
extension FavoriteListProvider: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource { }

extension FavoriteListProvider: FavoriteProviderProtocol {
    func update(value: [Result]) {
        let data = value
        favoriList = data
    }
}
