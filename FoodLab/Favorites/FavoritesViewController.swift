//
//  FavoritesViewController.swift
//  FoodLab
//
//  Created by Paul Vayssier on 18/01/2023.
//

import UIKit


final class FavoritesViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        places = getFavoritesPlace()
        configureUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        places = getFavoritesPlace()
        tableView.reloadData()
    }

    // MARK: - Exposed Properties


    // MARK: - Exposed Methods


    // MARK: - Private Properties


    // MARK: - Private Properties
    private var places: [Place]! {
        didSet {
            tableView.reloadData()
        }
    }

        private let cellReuseIdentifier = String(describing: FavoritesViewController.self)

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
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = TabItem.favs.title
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }

    private func getFavoritesPlace() -> [Place] {
        Place.all.filter(\.isFavorite)
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
        return cell
    }
}

// MARK: - TableViewDelegate
extension FavoritesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }

    func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        UISwipeActionsConfiguration(actions: [
            UIContextualAction(style: .destructive, title: "Delete", handler: { [weak self] _, _, _ in
                guard let self else { return }
                self.places[indexPath.row].isFavorite = false
                self.places = self.places.filter({ $0.isFavorite })
            })
        ])
    }
}
