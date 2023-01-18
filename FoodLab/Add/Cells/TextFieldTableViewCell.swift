//
//  TextFieldTableViewCell.swift
//  FoodLab
//
//  Created by Gatien DIDRY on 18/01/2023.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {

    static let reuseIdentifier = String(describing: TextFieldTableViewCell.self)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var textField: UITextField = {
        let textFied = UITextField()
        return textFied
    }()

    let padding: CGFloat = 5

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureUI() {

        textField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: contentView.topAnchor),
            textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding ),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    func configure(placeholder: String) {
        textField.placeholder = placeholder
    }

}
