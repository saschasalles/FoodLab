//
//  HomeViewController.swift
//  FoodLab
//
//  Created by Paul Vayssier on 18/01/2023.
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
    }

    private let plus = UIImage(systemName: "plus")




    // MARK: - Exposed Properties

    // MARK: - Exposed Methods

    // MARK: - Private Properties

    //    private var places: [Place]! {
    //        didSet {
    //            collectionView.reloadData()
    //        }
    //    }
    //
    //    private var reviews: [Review]! {
    //        didSet {
    //            collectionView.reloadData()
    //        }
    //    }

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

    private var currentMode: PresentationMode = .place {
        didSet {
            guard currentMode != oldValue else { return }
            setBarButtonItem()
            updateCollectionViewLayout()
        }
    }

    private lazy var reviewLayout: UIView = {
        let view = UIView()

        return view
    }()

    private lazy var placeTableView: UITableView = {
        let tableView = UITableView()

        tableView.addSubview(UITextField())

        return tableView
    }()

    private lazy var placeLayout: UIView = {
        let view = UIView()
        view.addSubview(placeTableView)

        return view
    }()

    // MARK: - Private Methods

    

    private func makeMenu() -> UIMenu {
        let actions: [UIAction] = [
            UIAction(
                title: "Add new place",
                handler: { [weak self] _ in
                    self?.currentMode = .place
                }
            ),
            UIAction(
                title: "Add new review",
                handler: { [weak self] _ in
                    self?.currentMode = .review
                }
            )
        ]

        let menu = UIMenu(
            title: "Display Mode",
            image: nil,
            children: actions
        )

        return menu
    }

    private func configureUI() {
        view.backgroundColor = .systemGroupedBackground
        navigationItem.title = TabItem.home.title
        navigationController?.navigationBar.prefersLargeTitles = true

        setBarButtonItem()
    }

    private func updateCollectionViewLayout() {

        present(AddPlaceTableViewController(), animated: true)
    }

}
    // MARK: - Collection View

//    private let padding: CGFloat = 16
//
//
//
//    private lazy var collectionView: UICollectionView = {
//        let collectionView = UICollectionView(
//            frame: .zero,
//            collectionViewLayout: listLayout
//        )
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
////        collectionView.dataSource = self
////        collectionView.delegate = self
//
//        return collectionView
//    }()
//
//}


