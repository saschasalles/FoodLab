//
//  SwitchButtonTableViewCell.swift
//  FoodLab
//
//  Created by Paul Vayssier on 23/01/2023.
//

import UIKit

class SwitchButtonTableViewCell: UITableViewCell {

    let switchButton: UISwitch = {
        let switchButton = UISwitch()
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        switchButton.isUserInteractionEnabled = true
        switchButton.isEnabled = true
        return switchButton
    }()

    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Didot", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    static let reuseIdentifier = String(describing: SwitchButtonTableViewCell.self)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(label)
        addSubview(switchButton)
        switchButton.isUserInteractionEnabled = true
        isMultipleTouchEnabled = true


        NSLayoutConstraint.activate([
            switchButton.widthAnchor.constraint(equalToConstant: 70),
            switchButton.rightAnchor.constraint(equalToSystemSpacingAfter: rightAnchor, multiplier: 1),
            switchButton.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            switchButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),

            label.leadingAnchor.constraint(equalTo: leadingAnchor,  constant: 16),
            label.rightAnchor.constraint(equalToSystemSpacingAfter: rightAnchor, multiplier: 0.5),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(_ textValue: String) {
        label.text = textValue
    }
}
