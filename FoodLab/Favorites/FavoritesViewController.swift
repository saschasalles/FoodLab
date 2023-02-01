//
//  FavoritesViewController.swift
//  FoodLab
//
//  Created by Sascha Sallès on 17/01/2023.
//

import UIKit

final class FavoritesViewController: UITableViewController {

    init() {
        super.init(style: .insetGrouped)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        reloadData()
    }

    // MARK: - Private Properties

    private var favItems: [Place] = Place.all.filter(\.isFavorite) {
        willSet {
            tableView.backgroundView?.isHidden = !newValue.isEmpty
        }
    }

    private func deleteAction(row: Int) -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "") { [weak self] _, _, _ in
            guard let self else { return }

            let favItem = self.favItems[row]
            Place.all.first(where: { $0.id == favItem.id })?.isFavorite = false
            self.reloadData()
        }

        action.image = UIImage(systemName: "star.slash.fill")
        action.backgroundColor = .systemYellow

        return action
    }

    private func reloadData() {
        favItems = Place.all.filter(\.isFavorite)
        tableView.reloadData()
    }

    // MARK: - Private Methods

    private func configureUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = TabItem.favs.title

        tableView.register(
            FavoritesViewControllerCell.self,
            forCellReuseIdentifier: FavoritesViewControllerCell.reuseIdentifier
        )

        let emptyStateView = EmptyStateView(
            imageSystemName: "star.slash",
            text: "Looks like you haven't any favorites places"
        )

        tableView.backgroundView = emptyStateView.makeHostingController().view
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: FavoritesViewControllerCell.reuseIdentifier)
                as? FavoritesViewControllerCell else {
            return UITableViewCell()
        }

        let item = favItems[indexPath.row]
        cell.configure(title: item.name)

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [deleteAction(row: indexPath.row)])
    }
}

