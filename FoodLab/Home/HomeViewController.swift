//
//  HomeViewController.swift
//  FoodLab
//
//  Created by Sascha Sallès on 17/01/2023.
//

import UIKit

final class HomeViewController: UIViewController {

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
        places = Place.all
    }

    // MARK: - Data

    private var places: [Place]! {
        didSet {
            collectionView.reloadData()
        }
    }

    // MARK: - Menu

    private let menuImage = UIImage(systemName: "plus.circle")

    private func makeMenu() -> UIMenu {
        let actions: [UIAction] = [
            UIAction(
                title: "Add New Place",
                image: UIImage(systemName: "mappin"),
                handler: {_ in self.showModal()}
            ),
            UIAction(
                title: "Add New Review",
                image: UIImage(systemName: "list.bullet.clipboard"),
                handler: {_ in self.showModal()}
            )
        ]

        let menu = UIMenu(
            title: "",
            image: nil,
            children: actions
        )

        return menu
    }

    private func setBarButtonItem() {
        let item = UIBarButtonItem(
            image: menuImage,
            primaryAction: nil,
            menu: makeMenu()
        )

        navigationItem.rightBarButtonItem = item
    }


    // MARK: - Modal

    func showModal() {
        let placeModalViewController = AddPlaceViewController()
        present(placeModalViewController, animated: true)
    }

    // MARK: - Exposed Methods


    // MARK: - Private Properties

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.layer.cornerCurve = .continuous
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    // MARK: - TableView

//    private let tableView: UITableView = {
//        let table = UITableView()
//        table.translatesAutoresizingMaskIntoConstraints = false
//        table.register(CustomTableViewCell.self,
//                       forCellReuseIdentifier: CustomTableViewCell.identifier)
//        return table
//    }()

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
            HomeCollectionViewCell.self,
            forCellWithReuseIdentifier: HomeCollectionViewCell.reuseIdentifier
        )

        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.alwaysBounceVertical = true
        collectionView.dataSource = self

        return collectionView
    }()

    // MARK: - Private Methods

    private func configureUI() {
        setBarButtonItem()

        view.addSubview(collectionView)

        view.backgroundColor = .systemGroupedBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = TabItem.home.title

        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }

    // MARK: - Override

//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        listLayout.frame = view.bounds
//    }
}

// MARK: DataSource && Delegate

//extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return Place.all.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(
//            withIdentifier: CustomTableViewCell.identifier,
//            for: indexPath) as? CustomTableViewCell else {
//                return UITableViewCell()
//            }
//
//        let index: Place = Place.all[indexPath.row]
//        let placeName: String = index.name
//        let placeImage: String = index.imagePath
//
//        cell.configure(text: placeName, imageName: placeImage)
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
//}


// MARK: - CollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return places.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        let place = places[indexPath.row]

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HomeCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? HomeCollectionViewCell else {
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
