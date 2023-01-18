//
//  FavoriteTableViewCell.swift
//  FoodLab
//
//  Created by Clément Dudit on 18/01/2023.
//

import UIKit

final class FavoriteTableViewCell: UITableViewCell {

    static let reuseIdentifier = String(describing: FavoriteTableViewCell.self)

    // MARK: - UI Properties

    private let padding: CGFloat = 8
    private let radius: CGFloat = 8

    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = radius
        imageView.layer.cornerCurve = .continuous
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textAlignment = .left
        return label
    }()


    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Exposed methods

    func configure(place: Place) {
        image.image = UIImage(named: place.imagePath)
        titleLabel.text = place.name
    }

    // MARK: - Private methods

    private func configureUI() {
        contentView.addSubview(image)
        contentView.addSubview(titleLabel)
        contentView.backgroundColor = .secondarySystemGroupedBackground
        contentView.layer.cornerRadius = radius + padding
        contentView.layer.cornerCurve = .continuous

        image.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.sizeToFit()

        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            image.heightAnchor.constraint(equalTo: image.widthAnchor),
            image.widthAnchor.constraint(equalToConstant: 60.0),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),

            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: padding),
            titleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        ])
    }
}
