//
//  Review.swift
//  FoodLab
//
//  Created by Sascha Sallès on 18/01/2023.
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
        Review(placeId: Place.all.first!.id, title: "La 1ere review", content: "Le content de la 1ere review", imagePaths: ["food-1"], rate: 6),
        Review(placeId: Place.all.first!.id, title: "La 1ere review", content: "Le content de la 1ere review", imagePaths: ["food-1"], rate: 6),
        Review(placeId: Place.all.first!.id, title: "La 1ere review", content: "Le content de la 1ere review", imagePaths: ["food-1"], rate: 6),
        Review(placeId: Place.all.first!.id, title: "La 1ere review", content: "Le content de la 1ere review", imagePaths: ["food-1"], rate: 6),
        Review(placeId: Place.all.first!.id, title: "La 1ere review", content: "Le content de la 1ere review", imagePaths: ["food-1"], rate: 6)
    ]
}
