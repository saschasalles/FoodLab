//
//  AddPhotoTableViewCell.swift
//  FoodLab
//
//  Created by Antoine Lucchini on 28/01/2023.
//

import UIKit

class AddPhotoTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    static let reuseIdentifier = String(describing: AddPhotoTableViewCell.self)

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

//    private lazy var imagePicker: UIImagePickerController = {
//        let imagePicker = UIImagePickerController()
//        imagePicker.delegate = self
//        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
//
//        return imagePicker
//    }()

    private lazy var imagePickerLabel: UILabel = {
        let label = UILabel()
        label.text = "Add Pictures From Library"
        label.textColor = UIColor(named: "AccentColor")
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .left

        return label
    }()

    private lazy var imagePickerButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.addTarget(self, action: #selector(pressed), for: .touchUpInside)

        return button
    }()

    @objc func pressed() {
        print("test")
    }

    private func configureUI() {
        contentView.addSubview(imagePickerLabel)
        contentView.addSubview(imagePickerButton)
        contentView.backgroundColor = .secondarySystemGroupedBackground

        imagePickerLabel.translatesAutoresizingMaskIntoConstraints = false
        imagePickerButton.translatesAutoresizingMaskIntoConstraints = false

        imagePickerLabel.sizeToFit()

        let padding: CGFloat = 10

        NSLayoutConstraint.activate([
            imagePickerLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imagePickerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            imagePickerButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imagePickerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        ])
    }

}
