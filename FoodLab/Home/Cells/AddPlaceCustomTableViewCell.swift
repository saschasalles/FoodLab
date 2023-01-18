//
//  AddPlaceCustomTableViewCell.swift
//  FoodLab
//
//  Created by Paul Vayssier on 18/01/2023.
//

import UIKit

class AddPlaceCustomTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    static let reuseIdentifier = String(describing: AddPlaceCustomTableViewCell.self)

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    let dataTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 20)
        return textField
    }()

    private func configureUI() {
        contentView.addSubview(dataTextField)
        contentView.addSubview(dataTextField)
        contentView.backgroundColor = .tertiarySystemGroupedBackground
    }

}
