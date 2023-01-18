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

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        favoritePlaces = Place.all
        configureUI()
    }

    // MARK: - Exposed Properties


    // MARK: - Exposed Methods


    // MARK: - Private Properties

    private var favoritePlaces : [Place] = Place.all

    private let cellReuseIdentifier = "placeCellReuseIdentifier"

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(FavoriteViewCell.self, forCellReuseIdentifier: FavoriteViewCell.reuseIdentifier)

        tableView.dataSource = self
        tableView.delegate = self

        return tableView
    }()

    // MARK: - Private Methods

    private func configureUI() {
        view.addSubview(tableView)
        view.backgroundColor = .systemGroupedBackground

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = TabItem.favs.title

        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

    // MARK: - TableViewDataSource
    extension FavoritesViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return favoritePlaces.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteViewCell.reuseIdentifier) as? FavoriteViewCell else {
                return FavoriteViewCell()
            }

            cell.config(place: favoritePlaces[indexPath.row])

            return cell
        }
    }

    // MARK: - TableViewDelegate
    extension FavoritesViewController: UITableViewDelegate {

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 55
        }

        func tableView(
            _ tableView: UITableView,
            trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
        ) -> UISwipeActionsConfiguration? {
            UISwipeActionsConfiguration(actions: [
                UIContextualAction(style: .destructive, title: "Supprimer", handler: { [weak self] _, _, _ in
                    guard let self else { return }
                    Place.all.removeAll(where: {$0.name == self.favoritePlaces[indexPath.row].name})
                    self.tableView.reloadData()
                })
            ])
        }
    }
