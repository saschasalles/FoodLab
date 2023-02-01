//
//  FormLibraryCell.swift
//  FoodLab
//
//  Created by Sascha Sallès on 21/01/2023.
//

import UIKit

final class FormLibraryCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private

    private lazy var config: UIListContentConfiguration = {
        var conf = defaultContentConfiguration()
        conf.textProperties.color = .tintColor

        return conf
    }()

    private let plusImageView = UIImageView(image: UIImage(systemName: "plus"))


    override func updateConfiguration(using state: UICellConfigurationState) {
        super.updateConfiguration(using: state)

        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self else { return }
            self.contentView.alpha = state.isHighlighted ? 0.6 : 1
        }
    }


    // MARK: Exposed

    func configure(title: String) {
        selectionStyle = .none
        config.text = title
        contentConfiguration = config
        accessoryView = plusImageView
    }

}