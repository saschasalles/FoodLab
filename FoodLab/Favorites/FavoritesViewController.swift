//
//  FavoritesViewController.swift
//  FoodLab
//
//  Created by Sascha Sallès on 17/01/2023.
//

import UIKit

final class FavoritesViewController: UIViewController, UICollectionViewDataSource {
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return dataSource.count
//      }
//
//      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaceCell", for: indexPath) as! PlaceCell
//        let place = dataSource[indexPath.row]
//        cell.configure(with: place)
//        return cell
//      }
//    }
    
    let favoriteView = FavoriteView()
    var dataSource: UICollectionViewDiffableDataSource<Section, Place>?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupCollectionView()
    }
    
    // MARK: - Exposed Properties
    
    // MARK: - Exposed Methods
    
    // MARK: - Private Properties
    
    // MARK: - Private Methods
    
    
    func setupCollectionView() {
        let registration = UICollectionView.CellRegistration<UICollectionViewListCell, Place> {
            cell, indexPath, place in
            
            var content = cell.defaultContentConfiguration()
            content.text = place.name
            cell.contentConfiguration = content
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Place>(collectionView: favoriteView.collectionView) {
            collectionView, indexPath, place in
            
            collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: place)
        }
    }
    
    //    func getPlaces() {
    //        NetworkingService.request
    //    }
    
    func populate(with places: [Place]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Place>()
        snapshot.appendSections([.main])
        snapshot.appendItems(places)
        dataSource?.apply(snapshot)
    }
    
    private func configureUI() {
        view = favoriteView
        view.backgroundColor = .systemGroupedBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = TabItem.favs.title
    }
}

extension FavoritesViewController {
    enum Section {
        case main
    }
}
