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

        init() {
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
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

        tableView.backgroundColor = .red

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
    }

    private func getFavorites() -> [Place] {
        Place.all.filter(\.isFavorite)
    }
}

    // MARK: - Exposed Properties


    // MARK: - Exposed Methods


    //MARK: - TableView Datasource

extension FavoritesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(places.count)
        return places.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesTableViewCell.reuseIdentifier) as? FavoritesTableViewCell else {
            return UITableViewCell()
        }

        let place = places[indexPath.row]
        cell.configure(place: place)

        return cell
    }
}

    //MARK: - TableView Delegate

extension FavoritesViewController: UITableViewDelegate {

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
