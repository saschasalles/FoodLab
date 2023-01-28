//
//  HomeViewController.swift
//  FoodLab
//
//  Created by Paul Vayssier on 18/01/2023.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        places = Place.all
        reviews = Review.all
        configureUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        places = Place.all
        reviews = Review.all
        tableView.reloadData()
    }





    // MARK: - Exposed Properties

    // MARK: - Exposed Methods

    // MARK: - Private Properties


    private let plus = UIImage(systemName: "plus")

    private var places: [Place]! {
        didSet {
            tableView.reloadData()
        }
    }

    private var reviews: [Review]! {
        didSet {
            tableView.reloadData()
        }
    }

    private func setBarButtonItem() {
        let item = UIBarButtonItem(
            image: plus,
            primaryAction: nil,
            menu: makeMenu()
        )

        navigationItem.rightBarButtonItem = item
    }

    private enum PresentationMode {
        case place
        case review
    }


    // MARK: - Private Methods

    

    private func makeMenu() -> UIMenu {
        let actions: [UIAction] = [
            UIAction(
                title: "Add New Place",
                image: UIImage(systemName: "mappin"),
                handler: { [weak self] _ in
                    self!.placeView()
                }
            ),
            UIAction(
                title: "Add New Review",
                image: UIImage(systemName: "list.bullet.clipboard"),
                handler: { [weak self] _ in
                    self!.reviewView()
                }
            )
        ]

        let menu = UIMenu(
            image: nil,
            children: actions
        )

        return menu
    }


    private let cellReuseIdentifier = String(describing: HomeViewController.self)

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

        tableView.dataSource = self
        tableView.delegate = self

        return tableView
    }()





    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .systemGroupedBackground
        navigationItem.title = TabItem.home.title
        navigationController?.navigationBar.prefersLargeTitles = true
        setBarButtonItem()

        tableView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }

    private func placeView() {

        present(AddPlaceTableViewController(), animated: true)
    }

    private func reviewView() {

        present(AddReviewTableViewController(), animated: true)
    }

}


// MARK: - TableViewDataSource
extension HomeViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return Place.all.count
        }
        return Review.all.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) else {
                return UITableViewCell()
            }

            let place = places[indexPath.row]
            cell.textLabel?.text = place.name
            cell.imageView?.image = UIImage(named: place.imagePath)
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) else {
            return UITableViewCell()
        }

        let review = reviews[indexPath.row]
        cell.textLabel?.text = review.title
        cell.imageView?.image = UIImage(named: review.imagePaths[0])
        return cell
    }
}

// MARK: - TableViewDelegate
extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }

    func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        if indexPath.section == 0 {
            return UISwipeActionsConfiguration(actions: [
                UIContextualAction(style: .destructive, title: "Favorite", handler: { [weak self] _, _, _ in
                    guard let self else { return }
                    self.places[indexPath.row].isFavorite = true
                    self.places = self.places.filter({ $0.isFavorite })
                })
            ])
        }
        return UISwipeActionsConfiguration()
    }
}

    // MARK: - Collection View

//    private let padding: CGFloat = 16

//    private lazy var gridLayout: UICollectionViewFlowLayout = {
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: view.frame.width / 2 - padding * 2, height: 180)
//        layout.minimumInteritemSpacing = padding
//        layout.minimumLineSpacing = padding
//        layout.sectionInset = UIEdgeInsets(top: 10, left: padding, bottom: 10, right: padding)
//
//        return layout
//    }()
//
//    private lazy var listLayout: UICollectionViewFlowLayout = {
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: view.frame.width - padding * 2, height: 70)
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 0
//        layout.sectionInset = UIEdgeInsets(top: 10, left: padding, bottom: 10, right: padding)
//
//        return layout
//    }()







//    private lazy var collectionView: UICollectionView = {
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: gridLayout)
//
//        collectionView.register(
//            HomeGridCollectionViewCell.self,
//            forCellWithReuseIdentifier: HomeGridCollectionViewCell.reuseIdentifier
//        )
//
//        collectionView.register(
//            HomeListCollectionViewCell.self,
//            forCellWithReuseIdentifier: HomeListCollectionViewCell.reuseIdentifier
//        )
//
//        collectionView.delaysContentTouches = false
//        collectionView.backgroundColor = .systemGroupedBackground
//        collectionView.alwaysBounceVertical = true
//        collectionView.dataSource = self
//        collectionView.delegate = self
//
//        return collectionView
//    }()



//extension HomeViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if section == 0 {
//            return reviews.count
//        }
//        return places.count
//    }
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        2
//    }
//
//    func collectionView(
//        _ collectionView: UICollectionView,
//        cellForItemAt indexPath: IndexPath
//    ) -> UICollectionViewCell {
//
//        if indexPath.section == 0 {
//
//            let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: HomeGridCollectionViewCell.reuseIdentifier,
//                for: indexPath
//            ) as? HomeGridCollectionViewCell
//            let review = reviews[indexPath.row]
//            cell?.configure(review: review)
//            return cell ?? HomeGridCollectionViewCell()
//
//        }
//        guard let cell = collectionView.dequeueReusableCell(
//            withReuseIdentifier: HomeListCollectionViewCell.reuseIdentifier,
//            for: indexPath
//        ) as? HomeListCollectionViewCell else {
//            return HomeListCollectionViewCell()
//        }
//        let place = places[indexPath.row]
//
//
//        cell.configure(place: place)
//        return cell
//
//    }
//}
