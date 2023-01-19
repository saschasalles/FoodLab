//
//  PickerIdentifiable.swift
//  FoodLab
//
//  Created by Clément Dudit on 19/01/2023.
//

import Foundation

protocol PickerIdentifiable {
    func getId() -> UUID
    func getText() -> String
}
