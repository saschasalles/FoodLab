//
//  PlaceModalTableViewCell.swift
//  FoodLab
//
//  Created by Antoine Lucchini on 18/01/2023.
//

import UIKit

// Une class par cell
// Appeler chaque classe grace au register
class PlaceModalTableViewCell: UITableViewCell {

    static let identifier = "PlaceModalTableViewCell"

    private let titleTextField = UITextField()
    private let contentTextField = UITextField()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white

        // configure titleField
        titleTextField.placeholder = "Title"
        titleTextField.borderStyle = .roundedRect
        contentView.addSubview(titleTextField)

        // configure contentTextView
        contentTextField.placeholder = "Content"
        contentTextField.borderStyle = .roundedRect
        contentView.addSubview(contentTextField)

        // configure addPlaceButton
        let addPlaceButton = UIButton(type: .system)
        addPlaceButton.setTitle("Add Place", for: .normal)
        addPlaceButton.setTitleColor(.white, for: .normal)
        addPlaceButton.addTarget(self, action: #selector(addPlaceButtonTapped), for: .touchUpInside)
        addPlaceButton.backgroundColor = UIColor.green
        contentView.addSubview(addPlaceButton)

        // add constraints to views
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        contentTextField.translatesAutoresizingMaskIntoConstraints = false
        addPlaceButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            contentTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            contentTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 10),
            contentTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            contentTextField.heightAnchor.constraint(equalToConstant: 50),

            addPlaceButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            addPlaceButton.topAnchor.constraint(equalTo: contentTextField.bottomAnchor, constant: 10),
            addPlaceButton.heightAnchor.constraint(equalToConstant: 50),
            addPlaceButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
        
    }

    @objc private func addPlaceButtonTapped(sender: UIButton!) {
        print("hello")
        // Save or Dismiss the view controller
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
