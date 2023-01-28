//
//  HomeReviewCollectionViewCell.swift
//  FoodLab
//
//  Created by Gatien DIDRY on 27/01/2023.
//

import UIKit

class HomeReviewCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = String(describing: HomeReviewCollectionViewCell.self)

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.layer.cornerCurve = .continuous
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .left

        return label
    }()

    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .gray
        label.textAlignment = .left

        return label
    }()

    let padding: CGFloat = 4

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureUI() {

        contentView.backgroundColor = .secondarySystemBackground
        contentView.layer.cornerRadius = 20

        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false

        imageView.clipsToBounds = true
        imageView.backgroundColor = .red

        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 180),

            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),

            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subTitleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor)
        ])

    }

    func configure(review: Review) {
        self.imageView.image = UIImage(named: review.imagePaths.first ?? "")
        self.titleLabel.text = review.title
        self.subTitleLabel.text = Place.all.first(where: {$0.id == review.placeId})?.name
    }

}
