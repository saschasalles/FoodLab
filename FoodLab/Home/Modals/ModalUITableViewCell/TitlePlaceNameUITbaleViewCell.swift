//
//  ModalUITableView.swift
//  FoodLab
//
//  Created by Antoine Lucchini on 28/01/2023.
//

import UIKit

class TitlePlaceNameUITableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    static let reuseIdentifier = String(describing: TitlePlaceNameUITableViewCell.self)

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

    private lazy var titletextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 16, weight: .medium)
        textField.textAlignment = .left
        textField.placeholder = AddPlace.template.isChoosed ? "Place Name" : "Title"

        return textField
    }()

    private func configureUI() {
        contentView.addSubview(titletextField)
        contentView.backgroundColor = .secondarySystemGroupedBackground

        titletextField.translatesAutoresizingMaskIntoConstraints = false

        titletextField.sizeToFit()

        let padding: CGFloat = 10

        NSLayoutConstraint.activate([
            titletextField.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -padding),
            titletextField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titletextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            titletextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        ])
    }
}
