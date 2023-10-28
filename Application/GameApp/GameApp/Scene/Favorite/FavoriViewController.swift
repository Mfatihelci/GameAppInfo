//
//  FavoriViewController.swift
//  GameApp
//
//  Created by muhammed fatih elçi on 26.10.2023.
//

import UIKit

class FavoriteViewController: UIViewController {

    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        return collectionview
    }()
    
    var favoriViewModel: FavoriteViewModelProtocol?
    var favoriteList =  FavoriteListProvider()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Favorite"
        favoriViewModel?.load()
        configure()
        drawDesing()
    }
    
    private func configure() {
        favoriViewModel?.favoriteDelegate = self
        collectionView.delegate = favoriteList
        collectionView.dataSource = favoriteList
        collectionView.register(FavoriteCollectionViewCell.self, forCellWithReuseIdentifier: FavoriteCollectionViewCell.Identifier.path.rawValue)
    }
    private func drawDesing() {
        view.addSubview(collectionView)
        makeCollectionView()
    }

}

extension FavoriteViewController: FavoriteViewModelDelegate {
    func handleOutPut(_ value: FavoriteViewModelOutPut) {
        switch value {
        case .showlist(let list):
            favoriteList.update(value: list)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

extension FavoriteViewController {
    private func makeCollectionView() {
        collectionView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).inset(10)
        }
    }
}
