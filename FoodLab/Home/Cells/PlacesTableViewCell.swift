//
//  PlacesTableViewCell.swift
//  FoodLab
//
//  Created by Clément Dudit on 18/01/2023.
//

import UIKit

class PlacesTableViewCell: UICollectionViewCell {

    static let reuseIdentifier = String(describing: PlacesTableViewCell.self)

    // MARK: - UI Properties

    static let imageSize: CGFloat = 30
    private let padding: CGFloat = 8
    private let radius: CGFloat = 8


    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = radius
        imageView.layer.cornerCurve = .continuous
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.textAlignment = .left
        return label
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textAlignment = .left
        return label
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Exposed methods

    func configure(place: Place) {
        imageView.image = UIImage(named: place.imagePath)
        titleLabel.text = place.name
        let reviewNumber = Review.all.filter { $0.placeId == place.id }.count
        let rating = reviewNumber > 1 ? "Ratings" : "Rating"
        subtitleLabel.text = String(reviewNumber) + " " + rating
    }

    // MARK: - Private methods

    private func configureUI() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.backgroundColor = .secondarySystemGroupedBackground

        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.sizeToFit()
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.sizeToFit()

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            imageView.heightAnchor.constraint(equalToConstant: Self.imageSize),
            imageView.widthAnchor.constraint(equalToConstant: Self.imageSize),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),

            titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: padding),

            subtitleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: padding)
        ])
    }
}
