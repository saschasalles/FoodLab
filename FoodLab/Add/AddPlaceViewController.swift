//
//  AddPlaceViewController.swift
//  FoodLab
//
//  Created by Gatien DIDRY on 18/01/2023.
//

import UIKit

class AddPlaceViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)

        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: TextFieldTableViewCell.reuseIdentifier)

        tableView.register(
            MultipleChoiceTableViewCell.self,
            forCellReuseIdentifier: MultipleChoiceTableViewCell.reuseIdentifier
        )

        tableView.register(
            SpaceButtonTableViewCell.self,
            forCellReuseIdentifier: SpaceButtonTableViewCell.reuseIdentifier
        )

        tableView.dataSource = self
        tableView.delegate = self

        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()

        // Do any additional setup after loading the view.
    }

    func configureUI() {
        view.backgroundColor = .systemGroupedBackground
        navigationItem.title = "TabItem.favs.title"

        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)

        ])

    }

}

extension AddPlaceViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 1 :
            return 150
        default :
            return 50
        }
    }

}

extension AddPlaceViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.row {

        case 0 :
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TextFieldTableViewCell.reuseIdentifier
            ) as? TextFieldTableViewCell else {
                return UITableViewCell()
            }

            cell.configure(placeholder: "Place name")
            return cell

        case 1 :
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TextFieldTableViewCell.reuseIdentifier
            ) as? TextFieldTableViewCell else {
                return UITableViewCell()
            }

            cell.configure(placeholder: "Description")
            return cell

        case 2 :
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: MultipleChoiceTableViewCell.reuseIdentifier
            ) as? MultipleChoiceTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(label: "Cook Style")
            return cell

        case 3 :
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SpaceButtonTableViewCell.reuseIdentifier
            ) as? SpaceButtonTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(textLabel: "Add Pictures From Library", sfSymbol: "plus")
            return cell




        default:
            return UITableViewCell()
        }
    }
}
