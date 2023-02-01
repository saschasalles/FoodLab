//
//  FormToggleCell.swift
//  FoodLab
//
//  Created by Sascha Sallès on 21/01/2023.
//

import UIKit

final class FormToggleCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private

    private lazy var toggleView: UISwitch = {
        let toggle = UISwitch()
        toggle.tintColor = .tintColor
        toggle.isOn = false

        return toggle
    }()

    // MARK: Exposed

    func configure(title: String) {
        selectionStyle = .none
        var conf = defaultContentConfiguration()
        conf.text = title
        contentConfiguration = conf
        accessoryView = toggleView
    }

    var isOn: Bool { toggleView.isOn }

}
