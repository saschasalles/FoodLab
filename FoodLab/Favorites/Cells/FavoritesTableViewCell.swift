//
//  FavoritesTableViewCell.swift
//  FoodLab
//
//  Created by Paul-Alexis Verrier on 18/01/2023.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    static let reuseIdentifier = String(describing: FavoritesTableViewCell.self)

    // MARK: - Private Methods

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
        imageView.layer.cornerRadius = 8
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
        contentView.addSubview(_imageView)
        contentView.addSubview(titleLabel)

        imageView?.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.sizeToFit()
    }

    // MARK: - Exposed

    func configure(place: Place) {
        titleLabel.text = place.name
        image.image = UIImage(named: place.imagePath)
    }
}
