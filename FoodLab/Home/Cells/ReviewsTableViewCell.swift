//
//  ReviewsTableViewCell.swift
//  FoodLab
//
//  Created by Clément Dudit on 18/01/2023.
//

import UIKit

final class ReviewsTableViewCell: UICollectionViewCell {

    static let reuseIdentifier = String(describing: ReviewsTableViewCell.self)

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

    func configure(review: Review) {
        image.image = UIImage(named: review.imagePaths[0])
        titleLabel.text = review.title
        subtitleLabel.text = review.content
    }

    // MARK: - Private methods

    private func configureUI() {
        contentView.addSubview(image)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.backgroundColor = .secondarySystemGroupedBackground
        contentView.layer.cornerRadius = radius + padding
        contentView.layer.cornerCurve = .continuous

        image.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.sizeToFit()
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.sizeToFit()

        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            image.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -(padding * 2)),
            image.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: padding),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),

            titleLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 3.0),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),

            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3.0),
            subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding)
        ])
    }
}
