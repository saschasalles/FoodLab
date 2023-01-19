//
//  SpaceButtonTableViewCell.swift
//  FoodLab
//
//  Created by Gatien DIDRY on 19/01/2023.
//

import UIKit

class SpaceButtonTableViewCell: UITableViewCell {

    static let reuseIdentifier = String(describing: SpaceButtonTableViewCell.self)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var label: UILabel = {
        var label = UILabel()
        label.textColor = UIColor(named: "AccentColor")
        return label
    }()

    var icon: UIImageView = {
        var icon = UIImageView()

        return icon
    }()

    let padding: CGFloat = 10

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureUI() {

        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)

        icon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(icon)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            icon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])

    }

    func configure(textLabel: String, sfSymbol: String) {
        label.text = textLabel
        icon.image = UIImage(systemName: sfSymbol)

    }

}
