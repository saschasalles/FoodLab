//
//  FavoritesListTableViewCell.swift
//  FoodLab
//
//  Created by Antoine Lucchini on 27/01/2023.
//

import UIKit

class FavoritesListTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    static let reuseIdentifier = String(describing: FavoritesListTableViewCell.self)

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

    private let imagePlaceView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.layer.cornerCurve = .continuous
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    private lazy var placeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .left

        return label
    }()

    private func configureUI() {
        contentView.addSubview(imagePlaceView)
        contentView.addSubview(placeLabel)
        contentView.backgroundColor = .secondarySystemGroupedBackground

        imagePlaceView.translatesAutoresizingMaskIntoConstraints = false
        placeLabel.translatesAutoresizingMaskIntoConstraints = false

        placeLabel.sizeToFit()

        let padding: CGFloat = 0

        NSLayoutConstraint.activate([
            imagePlaceView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -padding),
            imagePlaceView.widthAnchor.constraint(equalTo: imagePlaceView.heightAnchor),
            imagePlaceView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imagePlaceView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            placeLabel.leadingAnchor.constraint(equalTo: imagePlaceView.trailingAnchor, constant: padding),
            placeLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            placeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            placeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        ])
    }

    // MARK: - Exposed

    public func configure(place: Place) {
        placeLabel.text = place.name
        imagePlaceView.image = UIImage(named: place.imagePath)
    }

}
