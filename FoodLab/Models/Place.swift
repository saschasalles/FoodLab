//
//  Place.swift
//  FoodLab
//
//  Created by Sascha Sallès on 18/01/2023.
//

import Foundation

struct Place: Identifiable {
    let id = UUID()

    var name: String
    var cookStyle: CookStyle
    var description: String
    var isFavorite: Bool = false

    var coordinates: String?
    var imagePath: String

    static var all: [Self] = [
        .init(
            name: "Tutiac, Le Bistro des Vignerons",
            cookStyle: .french,
            description: "Notre jeune chef s’inspire des classiques de la gastronomie du Sud-ouest et y apporte sa créativité. Ici on défend le goût et les producteurs de nos régions.",
            imagePath: "tutiac"
        ),
        .init(
            name: "Maison Nouvelle",
            cookStyle: .fineDining,
            description: "Bienvenue chez Etxe Beste (maison nouvelle en basque) !",
            imagePath: "maison-nouvelle"
        ),
        .init(
            name: "Le Quatrieme Mur",
            cookStyle: .fineDining,
            description: "Installé dans le Grand Théâtre de Bordeaux, ce restaurant sert une cuisine de saison raffinée dans un cadre élégant et lumineux.",
            imagePath: "quatrieme-mur"
        ),
        .init(
            name: "Daily-D",
            cookStyle: .fastfood,
            description: "Sandwicherie préférée de Yannick Nay",
            imagePath: "daily-d"
        )
    ]
}

extension Place: Equatable, Hashable {}

enum CookStyle: String, CaseIterable {
    case french = "French"
    case fineDining = "Fine Dining"
    case indian = "Indian"
    case asian = "Asian"
    case fastfood = "Fast Food"
}
