//
//  FavoritesViewController.swift
//  FoodLab
//
//  Created by Sascha Sallès on 17/01/2023.
//

import UIKit


final class FavoritesViewController: UIViewController {

    private var favPlaces: [Place]! {
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
        favPlaces = Place.favorites
        configureUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        favPlaces = Place.favorites
        tableView.reloadData()
    }

    // MARK: - Exposed Properties


    // MARK: - Exposed Methods


    // MARK: - Private Properties
    private let padding: CGFloat = 16


    // MARK: - Private Methods
    private lazy var tableView: UITableView = {
            let tableView = UITableView(frame: .zero, style: .insetGrouped)
            tableView.register(PlacesTableViewCell.self, forCellReuseIdentifier: PlacesTableViewCell.reuseIdentifier)

            tableView.dataSource = self
            tableView.delegate = self

            return tableView
        }()

    private func configureUI() {
        view.addSubview(tableView)

        view.backgroundColor = .systemGroupedBackground
        navigationItem.title = TabItem.favs.title
        navigationController?.navigationBar.prefersLargeTitles = true

        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }

    
}

extension FavoritesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favPlaces.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlacesTableViewCell.reuseIdentifier) as? PlacesTableViewCell else {
            return UITableViewCell()
        }

        let place = favPlaces[indexPath.row]
        cell.configure(place: place)
        
        return cell
    }


}


extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        UISwipeActionsConfiguration(actions: [
            UIContextualAction(style: .destructive, title: "Remove", handler: { [weak self] _, _, _ in
                guard let self else { return }
                let place = self.favPlaces[indexPath.row].name
                self.favPlaces = self.favPlaces.filter({ $0.name != place })
            })
        ])
    }
}



