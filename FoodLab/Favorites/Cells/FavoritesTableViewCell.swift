//
//  FavoritesTableViewCell.swift
//  FoodLab
//
//  Created by Gatien DIDRY on 18/01/2023.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    static let reuseIdentifier = String(describing: FavoritesTableViewCell.self)

    // MARK: exposed properties
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textAlignment = .left

        return label
    }()

    private lazy var placeImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.clipsToBounds = true

        imageView.layer.cornerRadius = 8

        return imageView
    }()

    let padding: CGFloat = 8

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureUI() {

        nameLabel.font = .systemFont(ofSize: 13, weight: .medium)
        nameLabel.textAlignment = .left
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        placeImageView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(nameLabel)
        contentView.addSubview(placeImageView)

        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: placeImageView.trailingAnchor, constant: padding),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            placeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            placeImageView.widthAnchor.constraint(equalToConstant: 80),
            placeImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            placeImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
        ])

    }

    func configure(place: Place) {
        nameLabel.text = place.name
        placeImageView.image = UIImage(named: place.imagePath)
    }

}
