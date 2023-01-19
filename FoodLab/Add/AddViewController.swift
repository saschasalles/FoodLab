//
//  AddReviewViewController.swift
//  FoodLab
//
//  Created by Clément Dudit on 18/01/2023.
//

import UIKit

final class AddViewController: UIViewController {

    // MARK: - Exposed Properties

    var addType: AddType

    // MARK: - UI Properties

    private let padding: CGFloat = 16

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .systemGroupedBackground
        tableView.alwaysBounceVertical = true
        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: TextFieldTableViewCell.reuseIdentifier)
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.reuseIdentifier)
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.reuseIdentifier)
        tableView.register(PictureTableViewCell.self, forCellReuseIdentifier: PictureTableViewCell.reuseIdentifier)
        return tableView
    }()

    private lazy var addButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.tintColor = .tintColor
        return button
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
        addButton.setTitle("Add \(addType == .review ? "Review" : "Place")", for: .normal)
        view.addSubview(tableView)
        view.addSubview(addButton)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),

            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding),
            addButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: padding),
            addButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: padding)
        ])
    }
}

extension AddViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        do {
            let item = try getItemForRow(at: indexPath.row)
            if item == .picture {
                let imagePicker = UIImagePickerController()
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true)
            }
        } catch { }
    }
}

extension AddViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addType == .review ? 4 : 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        do {
            let item = try getItemForRow(at: indexPath.row)
            switch item {
            case .textField:
                let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.reuseIdentifier) as! TextFieldTableViewCell
                if indexPath.row == 0 {
                    cell.configure(placeholder: addType == .review ? "Title" : "Place Name")
                } else {
                    cell.configure(placeholder: addType == .review ? "Content" : "Description")
                }
                return cell

            case .picker:
                let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.reuseIdentifier) as! MenuTableViewCell
                cell.configure(
                    withText: addType == .review ? "Place" : "Cook Style",
                    options: addType == .review ? Place.all : CookStyle.allCases
                )
                return cell

            case .toggle:
                let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.reuseIdentifier) as! SwitchTableViewCell
                cell.configure(label: "Favorite Place")
                return cell

            case .picture:
                let cell = tableView.dequeueReusableCell(withIdentifier: PictureTableViewCell.reuseIdentifier) as! PictureTableViewCell
                return cell
            default:
                return UITableViewCell()
            }
        } catch {
            return UITableViewCell()
        }
    }

    private func getItemForRow(at row: Int) throws -> FieldType {
        switch row {
        case 0:
            return .textField
        case 1:
            return .textField
        case 2:
            return .picker
        case 3:
            return addType == .review ? .picture : .toggle
        case 4:
            return .picture
        default:
            throw "Error"
        }
    }
}

enum AddType: String {
    case review = "Review"
    case place = "Place"
}

enum FieldType {
    case textField, picker, picture, addButton, toggle
}

extension String: Error {}
