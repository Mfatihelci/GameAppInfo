//
//  ImageListProvider.swift
//  GameApp
//
//  Created by muhammed fatih elçi on 23.10.2023.
//

import UIKit
import Alamofire

class ImageListProvider: NSObject {
    var imageList: [Result] = []

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let collectionViewHeight = collectionView.bounds.height
        let adjustedWith = collectionViewWidth
        let width: CGFloat = floor(adjustedWith)
        let heightWith = collectionViewHeight
        let height: CGFloat = floor(heightWith)
        return CGSize(width: width, height: height)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return min(4,imageList.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let randomIndex = Int.random(in: 0..<imageList.count)
        let dataTwo = imageList[randomIndex]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:CollectionViewCell.Identifier.path.rawValue, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell()
            
        }
        cell.saveModel(value: dataTwo)
        return cell
    }
}

extension ImageListProvider: ImageListProviderProtocol {
    func update(value: [Result]) {
        let data = value
        imageList = data
    }
}
extension ImageListProvider: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource { }

