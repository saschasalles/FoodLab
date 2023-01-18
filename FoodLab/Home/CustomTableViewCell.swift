//
//  CustomTableViewCell.swift
//  FoodLab
//
//  Created by Antoine Lucchini on 18/01/2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"

    private let imagePlaceView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private let placeLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(imagePlaceView)
        contentView.addSubview(placeLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(text: String, imageName: String){
        placeLabel.text = text
        imagePlaceView.image = UIImage(named: imageName)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let imageContentViewSize = contentView.frame.size.height - 10

        imagePlaceView.frame = CGRect(
            x: 5,
            y: 5,
            width: imageContentViewSize,
            height: imageContentViewSize
        )

        placeLabel.frame = CGRect(
            x: 15 + imagePlaceView.frame.size.width,
            y: 5,
            width: contentView.frame.size.width,
            height: contentView.frame.size.height
        )
    }
    
}
