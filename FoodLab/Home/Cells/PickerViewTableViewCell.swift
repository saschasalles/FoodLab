//
//  PickerViewTableViewCell.swift
//  FoodLab
//
//  Created by Paul Vayssier on 23/01/2023.
//

import UIKit

class PickerViewTableViewCell: UITableViewCell {

    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isUserInteractionEnabled = true
        textField.isEnabled = true
        return textField
    }()

    static let reuseIdentifier = String(describing: PickerViewTableViewCell.self)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(textField)
        textField.isUserInteractionEnabled = true


        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure( placeholder: String? = nil, textColor: UIColor = .black, placeholderColor: UIColor = .lightGray) {
        textField.placeholder = placeholder
        textField.textColor = textColor
        textField.attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : placeholderColor])

        textField.isUserInteractionEnabled = true
    }

}
