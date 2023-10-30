//
//  GameDetailViewController.swift
//  GameApp
//
//  Created by muhammed fatih elçi on 18.10.2023.
//

//1. önce core data objesini oluştur kaydedilecek
//2. oluturduğun coredataya modeliyle gamelistresult verileri aynı olucak
//3. yıldıza bastığında gameresult modeli alıcak ve coredataya yazılıcak
//4. favoriden coredatadan kayıtlı verileri çekicem

import UIKit
import AlamofireImage
import SnapKit

class GameDetailViewController: UIViewController {

    
    private var gameImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 15
        image.layer.masksToBounds = true
        return image
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.tintColor = .yellow
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 30), forImageIn: .normal)
        //button.isSelected = true
           // button.setImage(UIImage(systemName: "star.fill"), for: .selected)
            button.setImage(UIImage(systemName: "star"), for: .normal)
        return button
    }()
    
    private var nameLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private var releaseLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private var metacriticLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private var descriptionLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
       let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.isScrollEnabled = true
        scroll.isPagingEnabled = true
        scroll.bounces = true
        scroll.backgroundColor = .white
        scroll.contentSize = CGSize(width: 0, height: view.frame.height)
        scroll.backgroundColor = UIColor.white
        return scroll
    }()
    
    private let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = true
        stackView.axis = .vertical
        stackView.spacing = 3.5
        return stackView
    }()
    
    var viewModel: DetailPageViewModel?
    var isFavorite = Bool()
    var gameID: Int?
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        viewModel?.load()
        configure()
        
    }
    
    
    private func configure() {
        viewModel?.delegate = self
        view.addSubview(gameImage)
        view.addSubview(favoriteButton)
        view.addSubview(scrollView)
        makeImage()
        makeFavorite()
        makeScroll()
        makeStackView()
        favorite()

    }
    private func favorite() {
        guard let buttonImage = image else { return }
        favoriteButton.setImage(buttonImage, for: .normal)
        //favoriteButton.addTarget(self, action: #selector(favoriteList()), for: .touchUpInside)
    }
    
    @objc func favoriteList() {
        
    }
    private func makeStackView() {
        
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(releaseLabel)
        stackView.addArrangedSubview(metacriticLabel)
        stackView.addArrangedSubview(descriptionLabel)
            
        stackView.snp.makeConstraints { make in
            make.top.bottom.trailing.leading.equalTo(scrollView)
            make.width.equalTo(scrollView.snp.width)
        }
    }
    
}

extension GameDetailViewController: DetailPageViewModelDelegate {
    func handleOutPut(_ value: GameDetailResult) {
        nameLabel.text = value.name
        nameLabel.textColor = .red
        releaseLabel.text = "Release Date: \(value.released)"
        metacriticLabel.text = "Metacriric Rate: \(value.metacritic)"
        descriptionLabel.text = value.description
        gameID = value.id
        
        DispatchQueue.main.async {
            if let url = URL(string: value.backgroundImage) {
                self.gameImage.af.setImage(withURL: url)
            }
        }
    }
}
extension GameDetailViewController {
    private func makeImage() {
        gameImage.snp.makeConstraints { make in
            make.top.equalTo(view).offset(0)
            make.left.right.equalTo(view).offset(0)
            make.height.equalTo(view.frame.height/1.6)
        }
    }
    private func makeFavorite() {
        favoriteButton.snp.makeConstraints { make in
            make.bottom.equalTo(gameImage.snp.bottom).offset(-20)
            make.left.equalTo(view).offset(20)
        }
    }
    
    private func makeScroll() {
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(gameImage.snp.bottom).offset(5)
            make.left.equalTo(view).offset(15)
            make.right.equalTo(view).offset(-15)
            make.bottom.equalTo(view).offset(-20)
        }
    }
}
