//
//  PickerCollectionViewCell.swift
//  FoodLab
//
//  Created by Clément Dudit on 19/01/2023.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    // MARK: - Exposed Properties

    static let reuseIdentifier = String(describing: MenuTableViewCell.self)

    // MARK: - Private Properties

    private let padding: CGFloat = 12
    private let textField: UITextField = UITextField(frame: .zero)
    private let buttonMenu: UIButton = {
        let button = UIButton()
        button.setTitleColor(.secondaryLabel, for: .normal)
        button.contentHorizontalAlignment = .trailing
        return button
    }()
    private var selectedId: UUID = UUID()

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Exposed Methods

    func configure(withText text: String, options: [any PickerIdentifiable]) {
        textField.text = text
        buttonMenu.showsMenuAsPrimaryAction = true
        let actions: [UIAction] = options.map { option in
            UIAction(
                title: option.getText(),
                state: selectedId == option.getId() ? .on : .off
            ) { [weak self] _ in
                self?.selectedId = option.getId()
                self?.buttonMenu.setTitle(option.getText(), for: .normal)
            }
        }
        buttonMenu.menu = UIMenu(title: "", children: actions)
        buttonMenu.setTitle(actions.first?.title, for: .normal)
    }

    // MARK: - Private Methods

    func configureUI() {
        contentView.addSubview(textField)
        contentView.addSubview(buttonMenu)
        textField.translatesAutoresizingMaskIntoConstraints = false
        buttonMenu.translatesAutoresizingMaskIntoConstraints = false
        textField.sizeToFit()
        buttonMenu.sizeToFit()

        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            textField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            buttonMenu.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            buttonMenu.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            buttonMenu.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.4),
            buttonMenu.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}
