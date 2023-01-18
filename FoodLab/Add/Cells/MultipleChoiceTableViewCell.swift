//
//  MultipleChoiceTableViewCell.swift
//  FoodLab
//
//  Created by Gatien DIDRY on 18/01/2023.
//

import UIKit

class MultipleChoiceTableViewCell: UITableViewCell {

    static let reuseIdentifier = String(describing: MultipleChoiceTableViewCell.self)

    let padding: CGFloat = 8

    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textAlignment = .left

        return label
    }()

    private lazy var dropdown: UIButton = {
        let button = UIButton()
        button.setTitle("\(CookStyle.allCases.first!)", for: .normal)
        button.menu = makeMenu()
        button.showsMenuAsPrimaryAction = true

        button.titleLabel?.backgroundColor = .black

        return button

    }()

    private func makeMenu() -> UIMenu {
        var actions: [UIAction] = []

        for cookStyle in CookStyle.allCases {
            actions.append(UIAction(title: cookStyle.rawValue, handler: {
                [weak self] element in
                self?.dropdown.setTitle(element.title, for: .normal)
            }))
        }

        let menu = UIMenu(
            image: nil,
            children: actions
            )

        return menu
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureUI() {
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)

        dropdown.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dropdown)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            dropdown.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            dropdown.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    func configure(label: String) {
        self.label.text = label

    }

}
