//
//  AddReviewTableViewController.swift
//  FoodLab
//
//  Created by Paul Vayssier on 18/01/2023.
//

import UIKit


final class AddReviewTableViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Exposed Properties


    // MARK: - Exposed Methods

    // MARK: - Private Properties

    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isUserInteractionEnabled = true
        textField.isEnabled = true
        return textField
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(TextFieldCustomTableViewCell.self, forCellReuseIdentifier: TextFieldCustomTableViewCell.reuseIdentifier)
        tableView.register(ButtonCustomTableViewCell.self, forCellReuseIdentifier: ButtonCustomTableViewCell.reuseIdentifier)
        tableView.register(SwitchButtonTableViewCell.self, forCellReuseIdentifier: SwitchButtonTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        self.isEditing = true

        return tableView
    }()



    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .systemGroupedBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = TabItem.favs.title

        view.addSubview(textField)

        textField.text = "Add Review"
        textField.textAlignment = .center

        view.addSubview(tableView)
        tableView.isUserInteractionEnabled = true

        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.topAnchor),
            textField.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 0.5),
            textField.rightAnchor.constraint(equalToSystemSpacingAfter: view.rightAnchor, multiplier: 0.5),
            textField.heightAnchor.constraint(equalToConstant: 30),

            tableView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16),
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
extension AddReviewTableViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1  {
            return 1
        }
        return 2
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCustomTableViewCell.reuseIdentifier) as? TextFieldCustomTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(placeholder: "Title")
                cell.isUserInteractionEnabled = true
                return cell
            } else if indexPath.row == 1 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCustomTableViewCell.reuseIdentifier) as? TextFieldCustomTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(placeholder: "Content")
                cell.isUserInteractionEnabled = true
                return cell
            }
            return UITableViewCell()
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ButtonCustomTableViewCell.reuseIdentifier) as? ButtonCustomTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(title: "Add Review")
            cell.isUserInteractionEnabled = true
            return cell
        }
        return UITableViewCell()
    }

}

// MARK: - TableViewDelegate
extension AddReviewTableViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1  {
            return 300
        } else if indexPath.section == 1 {
            return 60
        }
        return 50
    }

}
