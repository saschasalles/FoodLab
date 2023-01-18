//
//  HomeGridCollectionViewCell.swift
//  FoodLab
//
//  Created by Paul Vayssier on 18/01/2023.
//

import UIKit

class HomeGridCollectionViewCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    static let reuseIdentifier = String(describing: HomeGridCollectionViewCell.self)

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.layer.cornerCurve = .continuous
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    private lazy var reviewTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textAlignment = .left

        return label
    }()

    private lazy var reviewContentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textAlignment = .left

        return label
    }()
    private func configureUI() {
        contentView.addSubview(imageView)
        contentView.addSubview(reviewTitleLabel)
        contentView.addSubview(reviewContentLabel)
        contentView.backgroundColor = .secondarySystemGroupedBackground
        contentView.layer.cornerRadius = 12
        contentView.layer.cornerCurve = .continuous

        imageView.translatesAutoresizingMaskIntoConstraints = false
        reviewTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewContentLabel.translatesAutoresizingMaskIntoConstraints = false

        reviewTitleLabel.sizeToFit()
        reviewContentLabel.sizeToFit()

        reviewContentLabel.numberOfLines = 1

        let padding: CGFloat = 10

        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.75),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),

            reviewTitleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: padding),
            reviewTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            reviewTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            reviewTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),

            reviewContentLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: padding),
            reviewContentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            reviewContentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            reviewContentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
        ])
    }

    // MARK: - Exposed

    func configure(review: Review) {
        reviewTitleLabel.text = review.title
        imageView.image = UIImage(named: review.imagePaths.first!)
        reviewContentLabel.text = review.content
    }

}
