//
//  FavoriteViewCell.swift
//  FoodLab
//
//  Created by Yann Le Coz on 18/01/2023.
//

import UIKit

class FavoriteViewCell: UITableViewCell {

    static let reuseIdentifier = String(describing: FavoriteViewCell.self)

    private lazy var placeName: UILabel = {
        let label = UILabel()

        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .left

        return label
    }()

    var placeImage : UIImageView = {
        let imageView = UIImageView()

        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10

        return imageView
    }()

    let padding : CGFloat = 6

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            configureUI()

        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        func configureUI() {
            contentView.addSubview(placeName)
            contentView.addSubview(placeImage)

            placeName.translatesAutoresizingMaskIntoConstraints = false
            placeImage.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                placeName.leadingAnchor.constraint(equalTo: placeImage.trailingAnchor, constant: padding),
                placeName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

                placeImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
                placeImage.widthAnchor.constraint(equalToConstant: 40),
                placeImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
                placeImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
            ])

        }

        func config(place: Place) {
            placeName.text = place.name
            placeImage.image = UIImage(named: place.imagePath)
        }
}
