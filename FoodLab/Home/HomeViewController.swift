//
//  HomeViewController.swift
//  FoodLab
//
//  Created by Sascha Sallès on 17/01/2023.
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Private Properties

    private var places: [Place] = { Place.all }()
    private var reviews: [Review] = { Review.all }()

    // MARK: - UI Properties

    private let padding: CGFloat = 16

    enum SectionLayoutKind: Int, CaseIterable {
        case column, list
        var columnCount: Int {
            switch self {
            case .column:
                return 2

            case .list:
                return 1
            }
        }
    }

    private lazy var compositionalLayout: UICollectionViewCompositionalLayout = {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

            guard let sectionLayoutKind = SectionLayoutKind(rawValue: sectionIndex) else { return nil }

            // Create and sizing item
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                 heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            if sectionLayoutKind == .column {
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 14, bottom: 10, trailing: 14)
            } else {
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 14)
            }

            // Create and sizing group
            let groupHeight: NSCollectionLayoutDimension = sectionLayoutKind == .list ?
                .estimated(52) : .fractionalWidth(0.5)

            let groupWidth: NSCollectionLayoutDimension = sectionLayoutKind == .list ?
                .fractionalWidth(1.0) : .fractionalWidth(0.5)

            let groupSize = NSCollectionLayoutSize(widthDimension: groupWidth, heightDimension: groupHeight)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: sectionLayoutKind.columnCount)

            // Create section
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)
            section.boundarySupplementaryItems = [
                NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: HeaderCollectionReusableView.layoutSize,
                    elementKind: HeaderCollectionReusableView.reusableIdentifier,
                    alignment: .top
                )
            ]
            return section
        }
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: compositionalLayout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.alwaysBounceVertical = true
        collectionView.register(
            PlacesTableViewCell.self,
            forCellWithReuseIdentifier: PlacesTableViewCell.reuseIdentifier
        )
        collectionView.register(
            ReviewsTableViewCell.self,
            forCellWithReuseIdentifier: ReviewsTableViewCell.reuseIdentifier
        )
        collectionView.register(
            HeaderCollectionReusableView.self,
            forSupplementaryViewOfKind: HeaderCollectionReusableView.kind,
            withReuseIdentifier: HeaderCollectionReusableView.reusableIdentifier
        )
        return collectionView
    }()

    // MARK: - Lifecycle

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .systemGroupedBackground
        navigationItem.title = TabItem.home.title
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            primaryAction: nil,
            menu: makeMenu()
        )
        navigationItem.rightBarButtonItem?.tintColor = .tintColor

        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func makeMenu() -> UIMenu {
        let actions: [UIAction] = [
            UIAction(
                title: "Add New Place",
                image: UIImage(systemName: "mappin"),
                handler: { [weak self] _ in

                }
            ),
            UIAction(
                title: "Add New Review",
                image: UIImage(systemName: "list.bullet.clipboard"),
                handler: { [weak self] _ in

                }
            )
        ]
        let menu = UIMenu(children: actions)
        return menu
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }

}

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? reviews.count : places.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: HeaderCollectionReusableView.reusableIdentifier,
            for: indexPath
        ) as? HeaderCollectionReusableView else {
            return HeaderCollectionReusableView()
        }

        if indexPath.section == 0 {
            headerView.configure(text: "Last added reviews")
        } else {
            headerView.configure(text: "Last added places")
        }

        return headerView
    }

    func collectionView(
        _ collectionView: UICollectionView,
        contextMenuConfigurationForItemsAt indexPaths: [IndexPath],
        point: CGPoint
    ) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(actionProvider: { _ in
            return UIMenu(children: [
                UIAction(title: "Delete", attributes: .destructive, handler: { [weak self] _ in
                    guard let self else { return }
                    if indexPaths[0].section == 0 {
                        self.reviews = self.reviews.filter { $0.id != self.reviews[indexPaths[0].row].id }
                    } else {
                        self.places = self.places.filter { $0.id != self.places[indexPaths[0].row].id }
                    }

                    collectionView.reloadData()
                })
            ])
        })
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = SectionLayoutKind(rawValue: indexPath.section)
        switch section {
            case .column:
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: ReviewsTableViewCell.reuseIdentifier,
                    for: indexPath
                ) as? ReviewsTableViewCell else {
                    return ReviewsTableViewCell()
                }

                cell.configure(review: reviews[indexPath.row])
                return cell

            case .list:
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: PlacesTableViewCell.reuseIdentifier,
                    for: indexPath
                ) as? PlacesTableViewCell else {
                    return PlacesTableViewCell()
                }

                if indexPath.row == 0 {
                    cell.roundCorners(corners: [.topLeft, .topRight], radius: 12)
                } else if indexPath.row == places.count - 1 {
                    cell.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 12)
                }

                cell.layer.borderColor = UIColor.black.cgColor
                cell.layer.borderWidth = 1.0

                cell.configure(place: places[indexPath.row])
                return cell

            default:
                return UICollectionViewCell()
        }
    }
}
