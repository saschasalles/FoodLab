//
//  AddPlace.swift
//  FoodLab
//
//  Created by Antoine Lucchini on 28/01/2023.
//

import Foundation
import UIKit

final class HomeModals {
    init(
        modalTitle: String,
        cellType: String,
        cellContent: String,
        pickerName: String,
        favorite: String? = nil,
        buttonLabel: String,
        isChoosed: Bool
    ){
        self.modalTitle = modalTitle
        self.cellType = cellType
        self.cellContent = cellContent
        self.pickerName = pickerName
        self.favorite = favorite
        self.buttonLabel = buttonLabel
        self.isChoosed = isChoosed
    }
    let id = UUID()

    var modalTitle: String
    var cellType: String
    var cellContent: String
    var pickerName: String
    var favorite: String?

    let buttonLabel: String

    private(set) var isChoosed: Bool

    static var addPlaceTemplate = HomeModals(
        modalTitle: "Add Place",
        cellType: "Place Name",
        cellContent: "Description",
        pickerName: "Cook Style",
        favorite: "Favorite Place",
        buttonLabel: "Add Place",
        isChoosed: false
    )

    static var addReviewTemplate = HomeModals(
        modalTitle: "Add Review",
        cellType: "Title",
        cellContent: "Content",
        pickerName: "Place",
        buttonLabel: "Add Review",
        isChoosed: false
    )

    func changeChoosed(_ choosed: Bool){
        isChoosed = choosed
    }
}

enum ModalChoose {
    case list
    case grid
}
