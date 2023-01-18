//
//  FavoritesViewController.swift
//  FoodLab
//
//  Created by Sascha Sallès on 17/01/2023.
//

import UIKit

final class FavoritesViewController: UIViewController {

    // MARK: - Private Properties

    private var places: [Place]! {
        didSet {
            tableView.reloadData()
        }
    }

    private let cellReuseIdentifier = "PlaceCellReuseIdentifier"

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

        tableView.dataSource = self
        tableView.delegate = self

        return tableView
    }()

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        places = getPlaces()
        configureUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        places = getPlaces()
        tableView.reloadData()
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.addSubview(tableView)

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Favorites"

        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }

    private func getPlaces() -> [Place] {
        Place.all
    }
}

// MARK: - TableViewDataSource

extension FavoritesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) else {
            return UITableViewCell()
        }

        let place = places[indexPath.row]
        cell.textLabel?.text = place.name
        cell.imageView?.image = UIImage(named: place.imagePath)
        cell.imageView?.layer.cornerRadius = 10
        cell.imageView?.clipsToBounds = true
        cell.imageView?.contentMode = .scaleAspectFit

        return cell
    }
}

// MARK: - TableViewDelegate

extension FavoritesViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        UISwipeActionsConfiguration(actions: [
            UIContextualAction(style: .destructive, title: "delete", handler: { [weak self] _, _, _ in
                guard let self else { return }
                let placeName = self.places[indexPath.row].name
                self.places = self.places.filter({ $0.name != placeName })
            })
        ])
    }
}
