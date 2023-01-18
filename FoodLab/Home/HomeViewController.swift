//
//  HomeViewController.swift
//  FoodLab
//
//  Created by Sascha Sallès on 17/01/2023.
//

import UIKit

final class HomeViewController: UIViewController {

    private var places: [Place]! {
        didSet {
            collectionView.reloadData()
        }
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        places = Place.all
        configureUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        places = Place.all
        collectionView.reloadData()
    }

    // MARK: - Exposed Properties


    // MARK: - Exposed Methods
    

    // MARK: - Private Properties
    private let padding: CGFloat = 16

    // MARK: - Private Methods

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: listLayout
        )

        collectionView.register(PlacesListCollectionViewCell.self, forCellWithReuseIdentifier: PlacesListCollectionViewCell.reuseIdentifier)

        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.alwaysBounceVertical = true
        collectionView.dataSource = self


        return collectionView
    }()

    private lazy var listLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width - padding * 2, height: 70)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 10, left: padding, bottom: 10, right: padding)

        return layout
    }()

    private func configureUI() {
        view.addSubview(collectionView)

        view.backgroundColor = .systemGroupedBackground
        navigationItem.title = TabItem.home.title
        navigationController?.navigationBar.prefersLargeTitles = true

        collectionView.translatesAutoresizingMaskIntoConstraints = false


        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return places.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let place = places[indexPath.row]

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PlacesListCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? PlacesListCollectionViewCell else {
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
