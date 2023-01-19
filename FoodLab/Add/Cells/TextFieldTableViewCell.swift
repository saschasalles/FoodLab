//
//  TextFieldCollectionViewCell.swift
//  FoodLab
//
//  Created by Clément Dudit on 18/01/2023.
//

import UIKit

final class TextFieldTableViewCell: UITableViewCell {

    // MARK: - Exposed Properties

    static let reuseIdentifier = String(describing: TextFieldTableViewCell.self)

    // MARK: - Private Properties

    private let textField: UITextField = UITextField(frame: .zero)
    private let padding: CGFloat = 12

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Exposed Methods

    // TODO: faire varier la taille avec un nouveau paramètre
    func configure(placeholder: String) {
        textField.placeholder = placeholder
    }

    // MARK: - Private Methods

    private func configureUI() {
        contentView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: padding)
        ])
    }
}
