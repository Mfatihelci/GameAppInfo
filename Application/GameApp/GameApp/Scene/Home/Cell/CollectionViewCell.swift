//
//  CollectionViewCell.swift
//  GameApp
//
//  Created by muhammed fatih elçi on 23.10.2023.
//

import UIKit
import SnapKit
import AlamofireImage
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
    
    
    private lazy var gameImage: UIImageView = {
        let image = UIImageView()
       // image.layer.cornerRadius = 12
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        //image.backgroundColor = .white
        contentView.addSubview(image)
        return image
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
    }
    
    func saveModel(value: Result) {
       // gameImage.af.setImage(withURL: URL(string: value.backgroundImage)!)
        gameImage.kf.setImage(with: URL(string: value.backgroundImage)!)
    }
}

extension CollectionViewCell {
    private func makeImage() {
        gameImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(10)
            make.left.equalTo(contentView).offset(0)
            make.right.equalTo(contentView).offset(0)
            make.bottom.equalTo(contentView.safeAreaLayoutGuide).offset(10)
        }
    }
}
