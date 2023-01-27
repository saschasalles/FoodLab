//
//  Place.swift
//  FoodLab
//
//  Created by Sascha Sallès on 18/01/2023.
//

import Foundation

final class Place {
    init(
        name: String,
        cookStyle: CookStyle,
        description: String,
        imagePath: String
    ){
        self.name = name
        self.cookStyle = cookStyle
        self.description = description
        self.imagePath = imagePath
    }


    let id = UUID()

    var name: String
    var cookStyle: CookStyle
    var description: String
    private(set) var isFavorite: Bool = true

    var coordinates: String?
    var imagePath: String

    private(set) static var all: [Place] = [
        Place(
            name: "Tutiac, Le Bistro des Vignerons",
            cookStyle: .french,
            description: "Notre jeune chef s’inspire des classiques de la gastronomie du Sud-ouest et y apporte sa créativité. Ici on défend le goût et les producteurs de nos régions.",
            imagePath: "tutiac"
        ),
        Place(
            name: "Maison Nouvelle",
            cookStyle: .fineDining,
            description: "Bienvenue chez Etxe Beste (maison nouvelle en basque) !",
            imagePath: "maison-nouvelle"
        ),
        Place(
            name: "Le Quatrieme Mur",
            cookStyle: .fineDining,
            description: "Installé dans le Grand Théâtre de Bordeaux, ce restaurant sert une cuisine de saison raffinée dans un cadre élégant et lumineux.",
            imagePath: "quatrieme-mur"
        ),
        Place(
            name: "Daily-D",
            cookStyle: .fastfood,
            description: "Sandwicherie préférée de Yannick Nay",
            imagePath: "daily-d"
        )
    ]

    func setFavorite(_ favorite: Bool) {
        isFavorite = favorite
    }
}

extension Place: Equatable {
    static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.id == rhs.id
    }
}

enum CookStyle: String, CaseIterable {
    case french = "French"
    case fineDining = "Fine Dining"
    case indian = "Indian"
    case asian = "Asian"
    case fastfood = "Fast Food"
}
