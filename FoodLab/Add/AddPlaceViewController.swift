//
//  AddPlaceViewController.swift
//  FoodLab
//
//  Created by Gatien DIDRY on 18/01/2023.
//

import UIKit

class AddPlaceViewController: UIViewController {

    var numberRowInSectionOne = 4

    var picture: UIImage = {
        return UIImage()
    }()

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

        tableView.register(
            ImageTableViewCell.self,
            forCellReuseIdentifier: ImageTableViewCell.reuseIdentifier
        )

        tableView.register(
            ButtonTableViewCell.self,
            forCellReuseIdentifier: ButtonTableViewCell.reuseIdentifier
        )

        tableView.dataSource = self
        tableView.delegate = self

        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
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

        if indexPath.row == 3 {
            let picController = UIImagePickerController()
            picController.sourceType = .camera
            picController.allowsEditing = true
            picController.delegate = self
            present(picController, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 1 :
            return 150
        case 4 :
            return 400
        default :
            return 50
        }
    }

}

extension AddPlaceViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ?  numberRowInSectionOne :  1
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        if indexPath.section == 1 {
            return getButtonCell()
        }

        switch indexPath.row {

        case 0 :
            return getTextViewCell(placeholder: "Place name", returnKeyType: .next)

        case 1 :
            return getTextViewCell(placeholder: "Description", returnKeyType: .continue)

        case 2 :
            return getMultipleChoiceCell()

        case 3 :
            return getSpaceButtonCell()

        case 4 :
            return getImageCell()
        default:
            return UITableViewCell()
        }
    }
}

extension AddPlaceViewController: UINavigationControllerDelegate {

}

extension AddPlaceViewController: UIImagePickerControllerDelegate {

    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        numberRowInSectionOne = 5

        picture = image

        tableView.reloadData()

        picker.dismiss(animated: true)
    }
}

extension AddPlaceViewController {

    func getButtonCell() -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ButtonTableViewCell.reuseIdentifier
        ) as? ButtonTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(title: "Add place")

        return cell
    }

    func getTextViewCell(placeholder: String, returnKeyType: UIReturnKeyType) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TextFieldTableViewCell.reuseIdentifier
        ) as? TextFieldTableViewCell else {
            return UITableViewCell()
        }

        let nextFocus = {
            if let cellFocuse = self.tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? TextFieldTableViewCell {
                returnKeyType == .next ? cellFocuse.textField.becomeFirstResponder() : self.view.endEditing(true)

            }
        }

        cell.configure(
            placeholder: placeholder,
            returnKeyType: returnKeyType ,
            closure: nextFocus)
        return cell
    }

    func getMultipleChoiceCell() -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MultipleChoiceTableViewCell.reuseIdentifier
        ) as? MultipleChoiceTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(label: "Cook Style")
        return cell
    }

    func getSpaceButtonCell() -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SpaceButtonTableViewCell.reuseIdentifier
        ) as? SpaceButtonTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(textLabel: "Take picture", sfSymbol: "plus")
        return cell
    }

    func getImageCell() -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ImageTableViewCell.reuseIdentifier
        ) as? ImageTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(image: picture)
        return cell
    }

}
