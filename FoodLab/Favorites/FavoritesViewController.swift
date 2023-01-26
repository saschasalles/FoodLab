//
//  FavoritesViewController.swift
//  FoodLab
//
//  Created by Sascha Sallès on 17/01/2023.
//

import UIKit


final class FavoritesViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Data

    private var places: [Place]! {
        didSet {
            collectionView.reloadData()
        }
    }

    // MARK: - Collection View

    private let padding: CGFloat = 16

    private lazy var listLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width - padding * 2, height: 70)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 10, left: padding, bottom: 10, right: padding)

        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: listLayout
        )

        collectionView.register(
            FavoritesListCollectionViewCell.self,
            forCellWithReuseIdentifier: FavoritesListCollectionViewCell.reuseIdentifier
        )

        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.alwaysBounceVertical = true
        collectionView.dataSource = self
        collectionView.delegate = self

        return collectionView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        places = getFavoritePlace()
        configureUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        places = getFavoritePlace()
        collectionView.reloadData()
    }

    // MARK: - Exposed Properties


    // MARK: - Exposed Methods


    // MARK: - Private Properties


    // MARK: - Private Methods

    private func configureUI() {
        view.addSubview(collectionView)

        view.backgroundColor = .systemGroupedBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = TabItem.favs.title

        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }

    private func getFavoritePlace() -> [Place] {
        Place.all.filter(\.isFavorite)
    }
}

// MARK: - CollectionViewDataSource

extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return places.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        contextMenuConfigurationForItemsAt indexPaths: [IndexPath],
        point: CGPoint
    ) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(actionProvider: { _ in
            return UIMenu(children: [
                UIAction(title: "Remove", attributes: .destructive) { [weak self] _ in
                    self?.places[indexPaths[0].row].setFavorite(false)
                    collectionView.reloadData()
                    self?.places = self?.getFavoritePlace()
                    print(self?.places[indexPaths[0].row].isFavorite)
                }
            ])
        })
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        let place = places[indexPath.row]

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: FavoritesListCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? FavoritesListCollectionViewCell else {
            return UICollectionViewCell()
        }

        if place == places.first {
            cell.contentView.layer.maskedCorners = [
                .layerMinXMinYCorner,
                .layerMaxXMinYCorner
            ]
            cell.contentView.layer.cornerRadius = 12
            cell.contentView.layer.cornerCurve = .continuous
        } else if place == places.last {
            cell.contentView.layer.maskedCorners = [
                .layerMinXMaxYCorner,
                .layerMaxXMaxYCorner
            ]
            cell.contentView.layer.cornerCurve = .continuous
            cell.contentView.layer.cornerRadius = 12
        } else {
            cell.contentView.layer.cornerRadius = 0
        }

        cell.configure(place: place)
        return cell

    }
}

// MARK: - CollectionViewDelegate

extension FavoritesViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let place = places[indexPath.row]
    }
}


