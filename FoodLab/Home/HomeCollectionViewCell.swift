//
//  HomeCollectionViewCell.swift
//  FoodLab
//
//  Created by Antoine Lucchini on 27/01/2023.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    static let reuseIdentifier = String(describing: HomeCollectionViewCell.self)

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
        imageView.layer.cornerRadius = 4
        imageView.layer.cornerCurve = .continuous
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .left

        return label
    }()

    private func configureUI() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.backgroundColor = .secondarySystemGroupedBackground

        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.sizeToFit()

        let padding: CGFloat = 10

        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -padding),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: padding),
            titleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        ])
    }

    // MARK: - Exposed

    func configure(place: Place) {
        titleLabel.text = place.name
        imageView.image = UIImage(named: place.imagePath)
    }
}