//
//  FavoritesViewController.swift
//  FoodLab
//
//  Created by Sascha Sallès on 17/01/2023.
//

import UIKit


final class FavoritesViewController: UIViewController {

    private var places: [Place] { getFavoritesPlaces() }
    private let reuseIdentifier = String(describing: FavoritesViewController.self)

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .systemGroupedBackground
        tableView.alwaysBounceVertical = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        return tableView
    }()

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


    // MARK: - Exposed Methods


    // MARK: - Private Properties


    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .systemGroupedBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = TabItem.favs.title
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func getFavoritesPlaces() -> [Place] {
        return Place.all.filter { $0.isFavorite }
    }
}

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        places.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) else {
            return UITableViewCell()
        }
        cell.textLabel?.text = places[indexPath.row].name

        return cell
    }
}

extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [
            UIContextualAction(
                style: .destructive,
                title: "Delete",
                handler: { [weak self] action, view, handler in
                    self?.places[indexPath.row].setIsFavorite(false)
                    tableView.reloadData()
                }
            )
        ])
    }
}
