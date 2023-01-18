//
//  PlacesListCollectionViewCell.swift
//  FoodLab
//
//  Created by Arthur VELLA on 18/01/2023.
//

import UIKit

class PlacesListCollectionViewCell: UICollectionViewCell {
    var listType: ListType

    override init(frame: CGRect) {
        listType = .normal
        super.init(frame: frame)
        configureUI()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    static let reuseIdentifier = String(describing: PlacesListCollectionViewCell.self)

    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.2) { [weak self] in
                guard let self else { return }
                self.contentView.backgroundColor = self.isHighlighted
                ? .tertiarySystemGroupedBackground
                : .secondarySystemGroupedBackground
            }
        }
    }

    private lazy var imageView: UIImageView = {
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

    private lazy var reviewsLabel: UILabel = {
        let label = UILabel()
        label.text = "0 rating"
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textAlignment = .left
        return label
    }()

    private func configureUI() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        if listType == .normal {
            contentView.addSubview(reviewsLabel)
        }
        contentView.backgroundColor = .secondarySystemGroupedBackground

        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewsLabel.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.sizeToFit()
        reviewsLabel.sizeToFit()

        let padding: CGFloat = 10

        var layoutConstraint = [
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -padding),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),

        ]
        if listType == .normal {
            layoutConstraint.append(titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding*1.5))
            layoutConstraint.append(reviewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding))
            layoutConstraint.append(reviewsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor))
            layoutConstraint.append(reviewsLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: padding))
        } else {
            layoutConstraint.append(titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor))
        }

        NSLayoutConstraint.activate(layoutConstraint)
    }

    func configure(place: Place, type: ListType = .normal) {
        titleLabel.text = place.name
        imageView.image = UIImage(named: place.imagePath)
        listType = type
    }
}

enum ListType {
    case normal
    case favs
}
