//
//  SwitchTableViewCell.swift
//  FoodLab
//
//  Created by Clément Dudit on 19/01/2023.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    // MARK: - Exposed Properties

    static let reuseIdentifier = String(describing: SwitchTableViewCell.self)

    // MARK: - UI Properties

    private let padding: CGFloat = 12
    private let labelItem = UILabel(frame: .zero)
    private let switchItem = UISwitch(frame: .zero)

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Exposed Methods

    func configure(label: String) {
        labelItem.text = label
    }

    // MARK: - Private Methods

    private func configureUI() {
        contentView.addSubview(labelItem)
        contentView.addSubview(switchItem)
        labelItem.translatesAutoresizingMaskIntoConstraints = false
        switchItem.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            labelItem.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            labelItem.topAnchor.constraint(equalTo: contentView.topAnchor),
            labelItem.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            labelItem.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            switchItem.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            switchItem.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            switchItem.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            switchItem.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
