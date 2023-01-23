//
//  ButtonTableViewCell.swift
//  FoodLab
//
//  Created by Gatien DIDRY on 23/01/2023.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    static let reuseIdentifier = String(describing: ButtonTableViewCell.self)

    let padding: CGFloat = 16

    var button: UIButton = {
        var button = UIButton()
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10

        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureUI() {

        button.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(button)

        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding/2),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding/2)
        ])

    }

    func configure(title: String) {
        button.setTitle(title, for: .normal)
    }

}
