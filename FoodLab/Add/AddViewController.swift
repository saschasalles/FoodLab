//
//  AddReviewViewController.swift
//  FoodLab
//
//  Created by Clément Dudit on 18/01/2023.
//

import UIKit

final class AddViewController: UIViewController {
    var addType: AddType

    // MARK: - UI Properties
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .systemGroupedBackground
        tableView.alwaysBounceVertical = true
        tableView.register(TextFieldCollectionViewCell.self, forCellReuseIdentifier: TextFieldCollectionViewCell.reuseIdentifier)
        return tableView
    }()

    // MARK: - Lifecycle

    init(addType: AddType) {
        self.addType = addType
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Private methods

    private func configureUI() {
        view.backgroundColor = .systemGroupedBackground
        navigationItem.title = "Add \(addType.rawValue)"
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension AddViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension AddViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addType == .review ? 4 : 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TextFieldCollectionViewCell.reuseIdentifier
            ) as? TextFieldCollectionViewCell else {
                return UITableViewCell()
            }
            cell.configure(placeholder: addType == .review ? "Title" : "Place Name")
            return cell
        } else if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TextFieldCollectionViewCell.reuseIdentifier
            ) as? TextFieldCollectionViewCell else {
                return UITableViewCell()
            }
            cell.configure(placeholder: addType == .review ? "Content" : "Description", heightSize: 50)
            return cell
        }

        return UITableViewCell()
    }
}

enum AddType: String {
    case review = "Review"
    case place = "Place"
}

enum FieldType {
    case textField, picker, picture, addButton
}
