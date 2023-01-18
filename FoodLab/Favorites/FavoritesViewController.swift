//
//  FavoritesViewController.swift
//  FoodLab
//
//  Created by Sascha Sallès on 17/01/2023.
//

import UIKit


final class FavoritesViewController: UIViewController {

    private var places: [Place]! {
            didSet {
                tableView.reloadData()
            }
        }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        places = getFavorites()
        configureUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        places = getFavorites()
        tableView.reloadData()
    }

    // MARK: - Table View

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(FavoritesTableViewCell.self, forCellReuseIdentifier: FavoritesTableViewCell.reuseIdentifier)

        tableView.dataSource = self
        tableView.delegate = self

        return tableView
    }()

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .systemGroupedBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = TabItem.favs.title

        view.addSubview(tableView)
    }

    private func getFavorites() -> [Place] {
        Place.all.filter(\.isFavorite)
    }
}

    // MARK: - Exposed Properties


    // MARK: - Exposed Methods


    //MARK: - TableView Delegate

extension FavoritesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(places.count)
        return places.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesTableViewCell.reuseIdentifier) else {
            return UITableViewCell()
        }

        let place = places[indexPath.row]
        cell.textLabel?.text = place.name

        return cell
    }
}

    //MARK: - TableView Datasource

extension FavoritesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }

    func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        UISwipeActionsConfiguration(actions: [
            UIContextualAction(style: .destructive, title: "Remove", handler: { [weak self] _, _, _ in
                guard let self else { return }
                let placeName = self.places[indexPath.row].name
                self.places = self.places.filter({ $0.name != placeName })
            })
        ])
    }
}
