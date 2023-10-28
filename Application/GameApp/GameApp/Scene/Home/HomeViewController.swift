//
//  HomeViewController.swift
//  GameApp
//
//  Created by muhammed fatih elçi on 17.10.2023.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, UISearchBarDelegate {
    
//MARK: - View
    private var searchBar: UISearchController = {
        let search = UISearchController()
        search.searchBar.showsCancelButton = false
        return search
    }()
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
     lazy var twoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        collectionView.isPagingEnabled = true
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
     lazy var pageController: UIPageControl = {
        let page = UIPageControl()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.pageIndicatorTintColor = .black
        page.currentPageIndicatorTintColor = .systemRed
        return page
    }()
    
    var gameListProvider = GameListProvider()
    var imageListProvider = ImageListProvider()
    var viewmodel: ViewModelProtocol?
    var isSearchActive = false
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initDelegate()
        viewmodel?.load()
        title = "Games"
    }
    
    func initDelegate() {
        searchBar.searchResultsUpdater = self
        viewmodel?.delegate = self
        collectionView.dataSource = gameListProvider
        collectionView.delegate = gameListProvider
        gameListProvider.delegate = self
        twoCollectionView.delegate = imageListProvider
        twoCollectionView.dataSource = imageListProvider
        twoCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.Identifier.path.rawValue)
        collectionView.register(GameListCollectionViewCell.self, forCellWithReuseIdentifier: GameListCollectionViewCell.Identifier.path.rawValue)
        configure()
   }
    
    func configure() {
        view.backgroundColor = .white
        navigationItem.searchController = searchBar
        view.addSubview(twoCollectionView)
        view.addSubview(collectionView)
        view.addSubview(pageController)
        makeTwoCollection()
        makeCollection()
        makePage()
        Page()
        autoScrollCollectionView()
   }
    
    func Page() {
        pageController.numberOfPages = 4
        pageController.currentPage = 0
        pageController.addTarget(self, action: #selector(tikla), for: .valueChanged)
    }
    @objc func tikla() {
        let currentPage = pageController.currentPage
        let newIndexPath = IndexPath(item: currentPage, section: 0)
        twoCollectionView.scrollToItem(at: newIndexPath, at: .centeredHorizontally, animated: true)
    }
    
    func autoScrollCollectionView() {
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] _ in
                self?.currentPage += 1
                if self?.currentPage == 4 {
                    self?.currentPage = 0
                }
                self?.pageController.currentPage = self?.currentPage ?? 0
                let newIndexPath = IndexPath(item: self?.currentPage ?? 0, section: 0)
                self?.twoCollectionView.scrollToItem(at: newIndexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if searchBar.searchBar.text != "" {
            viewmodel?.searchCharacter(key: searchBar.searchBar.text!)
        }else {
            viewmodel?.load()
        }
    }
}

extension HomeViewController: ViewModelDelegate {
    func handleOutPut(_ output: ViewModelOutPut) {
        switch output {
        case .showList(let list):
            gameListProvider.update(value: list)
            imageListProvider.update(value: list)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.twoCollectionView.reloadData()
            }
        }
    }
}

extension HomeViewController: CollectionViewDelegate {
    func onSelected(at select: Int) {
        let specialPage = GameDetailBuilder.make(ID: select)
        specialPage.hidesBottomBarWhenPushed = true
        self.show(specialPage, sender: nil)
    }
}

extension HomeViewController {
    private func makeTwoCollection() {
        twoCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(200)
        }
    }
    
    private func makePage() {
        pageController.snp.makeConstraints { make in
            make.top.equalTo(twoCollectionView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.35)
            make.height.equalTo(20)
        }
    }
    private func makeCollection() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(pageController.snp.bottom).offset(10)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(5)
        }
    }
    private func searchCollection() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.left.equalTo(view).offset(0)
            make.right.equalTo(view).offset(0)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(0)
        }
    }
}
