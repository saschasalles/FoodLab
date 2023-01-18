//
//  Review.swift
//  FoodLab
//
//  Created by Paul Vayssier on 18/01/2023.
//

import Foundation

struct Review: Identifiable {
    let id = UUID()

    let placeId: UUID
    var title: String
    var content: String
    var imagePaths: [String]

    var rate: Int

    static var all: [Self] = [
        
    ]
}
