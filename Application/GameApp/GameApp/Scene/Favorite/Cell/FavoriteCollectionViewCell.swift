//
//  FavoriteCollectionViewCell.swift
//  GameApp
//
//  Created by muhammed fatih elçi on 26.10.2023.
//
import UIKit
import AlamofireImage
import SnapKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    
    private lazy var gameImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        contentView.addSubview(image)
        return image
    }()
    
    private lazy var gameRating: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = .black
        addSubview(label)
        return label
    }()
    
    private lazy var gameReleased: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = .black
        addSubview(label)
        return label
    }()
    
    private lazy var gameName: UILabel = {
        let label = UILabel()
         label.font = .boldSystemFont(ofSize: 18)
         label.textAlignment = .center
         label.numberOfLines = 0
         label.textColor = .systemIndigo
         addSubview(label)
         return label
    }()
    
    private lazy var gameNumber: UILabel = {
        let label = UILabel()
         label.font = .boldSystemFont(ofSize: 18)
         label.textAlignment = .center
         label.textColor = .red
         addSubview(label)
         return label
    }()
    
    enum Identifier: String {
        case path = "Cell"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        makeImage()
        makeName()
        makeRating()
        makeReleased()
        makeNumber()
    }
    
    func saveFavorite(value: GameFavorite) {
        gameName.text = value.name
        gameRating.text = "Rating : \(value.rating ?? "rating")"
        gameReleased.text = "Released : \(value.released ?? "released")"
       // gameImage.af.setImage(withURL: URL(string: value.backgroundImage ?? "")!)
    }
    
    func number(value: String) {
        gameNumber.text = "\(value)."
    }
}

extension FavoriteCollectionViewCell {
    private func makeImage() {
        gameImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(15)
            make.left.equalTo(contentView).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
    }
    
    private func makeName() {
        gameName.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(15)
            make.left.equalTo(gameNumber.snp.right).offset(0)
            make.right.lessThanOrEqualTo(contentView).inset(10) // Yeni satır
        }
    }
    
    private func makeReleased() {
        gameReleased.snp.makeConstraints { make in
            make.top.equalTo(gameName.snp.bottom).offset(5)
            make.left.equalTo(gameImage.snp.right).offset(10)
        }
    }
    
    private func makeRating() {
        gameRating.snp.makeConstraints { make in
            make.top.equalTo(gameReleased.snp.bottom).offset(5)
            make.left.equalTo(gameImage.snp.right).offset(10)
        }
    }
    
    private func makeNumber() {
        gameNumber.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(15)
            make.left.equalTo(gameImage.snp.right).offset(10)
        }
    }
}
