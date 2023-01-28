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
    }

    // MARK: - Exposed Properties

    private let plusImage = UIImage(systemName: "plus")

    private func setBarButtonItem() {
        let item = UIBarButtonItem(
            image: plusImage,
            primaryAction: nil,
            menu: makeMenu())

        navigationItem.rightBarButtonItem = item

    }

    private func makeMenu() -> UIMenu {
        let actions: [UIAction] = [
            UIAction(
                title: "Add New Place",
                image: UIImage(systemName: "mappin"),
                handler: {[weak self] _ in

                    let viewControllerToPresent = AddPlaceViewController()
                    self?.present(viewControllerToPresent, animated: true, completion: nil)

                }),
            UIAction(
                title: "Add New Review",
                image: UIImage(systemName: "list.bullet.clipboard"),
                handler: {[weak self] _ in

                })
        ]

        let menu = UIMenu(
            children: actions
        )

        return menu
    }

    // MARK: - Exposed Methods

    // MARK: - Private Properties

    private lazy var listLayout: UICollectionViewCompositionalLayout = {

        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

            if sectionIndex == 0 {
                let columns = 2

                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                       heightDimension: .fractionalHeight(0.3))

                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                               subitem: item,
                                                               count: columns)

                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 15, trailing: 0)
                section.interGroupSpacing = 30

                return section

            } else {

                let lane = 3

                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(0.2))

                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                       heightDimension: .fractionalHeight(1.0))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: itemSize, subitems: [item])

                let section = NSCollectionLayoutSection(group: group)
                return section
            }

        }

        let config = UICollectionViewCompositionalLayoutConfiguration()

        layout.configuration = config

        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: listLayout)
        collectionView.register(
            HomeReviewCollectionViewCell.self,
            forCellWithReuseIdentifier: HomeReviewCollectionViewCell.reuseIdentifier
        )

        collectionView.register(
            UICollectionViewCell.self,
            forCellWithReuseIdentifier: "UICollectionViewCell.reuseIdentifier"
        )

        collectionView.dataSource = self
        collectionView.delegate = self

        return collectionView
    }()

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .systemGroupedBackground
        navigationItem.title = TabItem.home.title
        navigationController?.navigationBar.prefersLargeTitles = true
        setBarButtonItem()

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension HomeViewController: UICollectionViewDelegate {
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Review.all.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HomeReviewCollectionViewCell.reuseIdentifier,
                for: indexPath
            ) as? HomeReviewCollectionViewCell else {
                return UICollectionViewCell()
            }

            cell.configure(review: Review.all.first!)

            return cell

    }

}
