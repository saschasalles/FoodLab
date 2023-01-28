//
//  ButtonCustomTableViewCell.swift
//  FoodLab
//
//  Created by Paul Vayssier on 18/01/2023.
//

import UIKit

class ButtonCustomTableViewCell: UITableViewCell {

    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    static let reuseIdentifier = String(describing: ButtonCustomTableViewCell.self)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(button)
        button.isUserInteractionEnabled = true

        button.isEnabled = true

        self.isUserInteractionEnabled = true

        button.layer.cornerRadius = 10

        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            button.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure( title: String) {
        button.backgroundColor = .systemGreen
        button.setTitle(title, for: UIControl.State())

        button.isUserInteractionEnabled = true
    }
}
