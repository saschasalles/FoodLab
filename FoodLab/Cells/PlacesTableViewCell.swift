//
//  PlacesTableViewCell.swift
//  FoodLab
//
//  Created by Arthur VELLA on 18/01/2023.
//

import UIKit

class PlacesTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    static let reuseIdentifier = String(describing: PlacesTableViewCell.self)

    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.layer.cornerCurve = .continuous

        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left

        return label
    }()

    func configureUI() {
        image.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.sizeToFit()

        let padding:CGFloat = 10

        contentView.addSubview(image)
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 60),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.heightAnchor.constraint(equalToConstant: 50),
            image.widthAnchor.constraint(equalTo: image.heightAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: padding),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
        ])
    }

    func configure(place: Place) {
        titleLabel.text = place.name
        image.image = UIImage(named: place.imagePath)
    }

}
