//
//  Place.swift
//  FoodLab
//
//  Created by Sascha Sallès on 18/01/2023.
//

import Foundation

class Place: Identifiable {
    let id = UUID()

    var name: String
    var cookStyle: CookStyle
    var description: String
    var isFavorite: Bool = false

    var coordinates: String?
    var imagePath: String

    init(
        name: String,
        cookStyle: CookStyle,
        description: String,
        isFavorite: Bool = false,
        coordinates: String? = nil,
        imagePath: String
    ) {
        self.name = name
        self.cookStyle = cookStyle
        self.description = description
        self.isFavorite = isFavorite
        self.coordinates = coordinates
        self.imagePath = imagePath
    }

    static var all: [Place] = [
        Place(
            name: "Tutiac, Le Bistro des Vignerons",
            cookStyle: .french,
            description: "Notre jeune chef s’inspire des classiques de la gastronomie du Sud-ouest et y apporte sa créativité. Ici on défend le goût et les producteurs de nos régions.",
            isFavorite: true,
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
            isFavorite: true,
            imagePath: "daily-d"
        )
    ]

    func setIsFavorite(_ isFavorite: Bool) {
        self.isFavorite = isFavorite
    }
}

extension Place: PickerIdentifiable {
    func getId() -> UUID {
        return id
    }
    
    func getText() -> String {
        return name
    }
}

extension Place: Equatable, Hashable {
    static func == (lhs: Place, rhs: Place) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

enum CookStyle: String, CaseIterable, PickerIdentifiable {
    case french = "French"
    case fineDining = "Fine Dining"
    case indian = "Indian"
    case asian = "Asian"
    case fastfood = "Fast Food"

    func getId() -> UUID {
        return UUID()
    }

    func getText() -> String {
        return rawValue
    }
}
