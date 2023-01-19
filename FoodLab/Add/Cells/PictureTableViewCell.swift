//
//  PictureTableViewCell.swift
//  FoodLab
//
//  Created by Clément Dudit on 19/01/2023.
//

import UIKit

class PictureTableViewCell: UITableViewCell {

    // MARK: - Exposed Properties

    static let reuseIdentifier = String(describing: PictureTableViewCell.self)

    // MARK: - UI Properties

    private let padding: CGFloat = 12
    private lazy var labelItem = {
        let label = UILabel(frame: .zero)
        label.text = "Add Pictures From Library"
        label.textColor = .tintColor
        return label
    }()
    private lazy var button = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(systemName: "plus"), for: .disabled)
        button.tintColor = .tintColor
        button.isEnabled = false
        return button
    }()

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func configureUI() {
        contentView.addSubview(labelItem)
        contentView.addSubview(button)
        labelItem.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            labelItem.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            labelItem.topAnchor.constraint(equalTo: contentView.topAnchor),
            labelItem.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            labelItem.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

