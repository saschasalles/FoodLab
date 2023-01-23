//
//  ImageTableViewCell.swift
//  FoodLab
//
//  Created by Gatien DIDRY on 23/01/2023.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    static let reuseIdentifier = String(describing: ImageTableViewCell.self)

    let picture: UIImageView = {
        var picture = UIImageView()
        picture.clipsToBounds = true
        picture.layer.cornerRadius = 10
        return picture

    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureUI() {

        picture.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(picture)

        NSLayoutConstraint.activate([
            picture.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            picture.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            picture.heightAnchor.constraint(equalToConstant: 300),
            picture.widthAnchor.constraint(equalToConstant: 300)
        ])
    }

    func configure(image: UIImage) {
        picture.image = image
    }

}
