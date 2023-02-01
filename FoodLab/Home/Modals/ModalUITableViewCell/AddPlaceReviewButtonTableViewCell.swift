//
//  AddPlaceReviewButtonTableViewCell.swift
//  FoodLab
//
//  Created by Antoine Lucchini on 28/01/2023.
//

import UIKit

class AddPlaceReviewButtonTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    static let reuseIdentifier = String(describing: AddPlaceReviewButtonTableViewCell.self)

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

    private func getModalButtonLabel() -> String{
        if(HomeModals.addPlaceTemplate.isChoosed){
            return HomeModals.addPlaceTemplate.buttonLabel
        }else{
            return HomeModals.addReviewTemplate.buttonLabel
        }
    }

    private lazy var addButton: UIButton = {
        let button = UIButton()
        let textButton = getModalButtonLabel()
        button.setTitle(textButton, for: .normal)
        button.backgroundColor = UIColor(named: "AccentColor")
        button.tintColor = UIColor.white
        button.addTarget(self, action: #selector(pressed), for: .touchUpInside)

        return button
    }()

    @objc func pressed() {
        print("test button")
    }

    private func configureUI() {
        contentView.addSubview(addButton)
        contentView.backgroundColor = .secondarySystemGroupedBackground

        addButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            addButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            addButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            addButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }

}
