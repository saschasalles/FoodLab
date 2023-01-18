//
//  Review.swift
//  FoodLab
//
//  Created by Sascha Sallès on 18/01/2023.
//

import Foundation

class Review: Identifiable {
    let id = UUID()

    let placeId: UUID
    var title: String
    var content: String
    var imagePaths: [String]
    var rate: Int

    init(placeId: UUID, title: String, content: String, imagePaths: [String], rate: Int) {
        self.placeId = placeId
        self.title = title
        self.content = content
        self.imagePaths = imagePaths
        self.rate = rate
    }

    static var all: [Review] = [
        Review(placeId: Place.all[0].id, title: "Dinguerie !", content: "Lorem ipsum dolor sit amet", imagePaths: ["food-1", "food-4"], rate: 4),
        Review(placeId: Place.all[1].id, title: "Pas fou", content: "Lorem ipsum dolor sit amet", imagePaths: ["food-2"], rate: 2),
        Review(placeId: Place.all[2].id, title: "Mitigé !", content: "Lorem ipsum dolor sit amet", imagePaths: ["food-3"], rate: 3)
    ]
}
