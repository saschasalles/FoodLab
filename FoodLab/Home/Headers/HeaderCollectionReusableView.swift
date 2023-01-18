//
//  HeaderCollectionReusableView.swift
//  FoodLab
//
//  Created by Clément Dudit on 18/01/2023.
//

import UIKit

final class HeaderCollectionReusableView: UICollectionReusableView {

    static let reusableIdentifier = String(describing: HeaderCollectionReusableView.self)
    static let kind = String(describing: HeaderCollectionReusableView.self)
    static let layoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .estimated(16))

    // MARK: - UI Properties

    private lazy var label: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .secondaryLabel
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.sizeToFit()
        return label
    }()

    // MARK: - Lifecycle

     override init(frame: CGRect) {
         super.init(frame: frame)
         addSubview(label)
         label.translatesAutoresizingMaskIntoConstraints = false

         NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor)
         ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Exposed Functions

    func configure(text: String) {
        label.text = text.uppercased()
    }
}
