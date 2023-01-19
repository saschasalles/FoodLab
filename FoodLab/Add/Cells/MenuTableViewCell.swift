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

    private let horizontalPadding: CGFloat = 12
    private let verticalPadding: CGFloat = 8
    private let labelItem: UILabel = UILabel(frame: .zero)
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
        labelItem.text = text
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
        contentView.addSubview(labelItem)
        contentView.addSubview(buttonMenu)
        labelItem.translatesAutoresizingMaskIntoConstraints = false
        buttonMenu.translatesAutoresizingMaskIntoConstraints = false
        labelItem.sizeToFit()
        buttonMenu.sizeToFit()

        NSLayoutConstraint.activate([
            labelItem.topAnchor.constraint(equalTo: contentView.topAnchor),
            labelItem.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            labelItem.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalPadding),
            labelItem.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            buttonMenu.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalPadding),
            buttonMenu.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -verticalPadding),
            buttonMenu.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalPadding),
            buttonMenu.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.4),
            buttonMenu.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}
