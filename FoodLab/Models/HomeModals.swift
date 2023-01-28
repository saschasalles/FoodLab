//
//  AddPlace.swift
//  FoodLab
//
//  Created by Antoine Lucchini on 28/01/2023.
//

import Foundation
import UIKit

final class AddPlace {
    init(
        modalTitle: String,
        placeName: String,
        description: String
    ){
        self.modalTitle = modalTitle
        self.placeName = placeName
        self.description = placeName
    }
    let id = UUID()

    var modalTitle: String
    var placeName: String
    var description: String
//    var cookStyle: UIPickerView
//    var isFavorite: Bool

//    let addPlaceLabel: UILabel

    private(set) var isChoosed = false

    static var template = AddPlace(
        modalTitle: "Add Place",
        placeName: "Place Name",
        description: "Description"
    )

    func changeChoosed(_ choosed: Bool){
        isChoosed = choosed
    }
}


final class AddReview {
    init(
        modalTitle: String,
        placeName: String,
        description: String
    ){
        self.modalTitle = modalTitle
        self.placeName = placeName
        self.description = placeName
    }
    let id = UUID()

    var modalTitle: String
    var placeName: String
    var description: String
//    var cookStyle: UIPickerView
//    var isFavorite: Bool

//    let addPlaceLabel: UILabel

    private(set) var isChoosed = false

    static var template = AddPlace(
        modalTitle: "Add Review",
        placeName: "Title",
        description: "Content"
    )

    func changeChoosed(_ choosed: Bool){
        isChoosed = choosed
    }
}

enum ModalChoose {
    case list
    case grid
}
