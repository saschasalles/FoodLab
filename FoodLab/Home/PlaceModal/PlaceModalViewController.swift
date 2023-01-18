//
//  ModalViewController.swift
//  FoodLab
//
//  Created by Antoine Lucchini on 18/01/2023.
//

import UIKit

class AddPlaceViewController: UIViewController {

    // MARK: - Private Properties

    // MARK: - Methods

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }

    // MARK: - TableView

    private let tableView: UITableView = {
        let table = UITableView()
        table.register(PlaceModalTableViewCell.self,
                       forCellReuseIdentifier: PlaceModalTableViewCell.identifier)
        return table
    }()
}

// MARK: DataSource && Delegate

extension AddPlaceViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PlaceModalTableViewCell.identifier,
            for: indexPath) as? PlaceModalTableViewCell else {
                return UITableViewCell()
            }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
