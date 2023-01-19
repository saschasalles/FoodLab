//
//  Data.swift
//  FoodLab
//
//  Created by Maxime Lestage on 18/01/2023.
//
import Foundation
import SwiftUI

struct PlaceData: Identifiable {
    let id = UUID()
    
    var name:[String]
    var cookStyle: [CookingStyle]
    var description: [String]
    var isFavorite: Bool = false
    
    var coordinates: String?
    var imagePath: [String]
}

let data = PlaceData(
    name: ["Tutiac, Le Bistro des Vignerons","Maison Nouvelle","Le Quatrieme Mur", "Daily-D"],
    cookStyle: [.french, .fineDining, .fineDining, .fastfood],
   description:[ "Notre jeune chef s’inspire des classiques de la gastronomie du Sud-ouest et y apporte sa créativité. Ici on défend le goût et les producteurs de nos régions.", "Bienvenue chez Etxe Beste (maison nouvelle en basque) !", "Installé dans le Grand Théâtre de Bordeaux, ce restaurant sert une cuisine de saison raffinée dans un cadre élégant et lumineux.",  "Sandwicherie préférée de Yannick Nay"],
    imagePath: ["tutiac", "maison-nouvelle","quatrieme-mur", "daily-d"]
)


extension PlaceData: Equatable, Hashable {}

enum CookingStyle: String, CaseIterable {
    case french = "French"
    case fineDining = "Fine Dining"
    case indian = "Indian"
    case asian = "Asian"
    case fastfood = "Fast Food"
}






    // V2

extension PlaceData2: Equatable, Hashable {}

struct PlaceData2: Identifiable {
    let id = UUID()

    var name:String
    var cookStyle: CookingStyle
    var description: String
    var isFavorite: Bool = false

    var coordinates: String?
    var imagePath: String
}


  var  data2 = [
    PlaceData2(
        name: "Tutiac, Le Bistro des Vignerons",
        cookStyle: .french,
        description: "Notre jeune chef s’inspire des classiques de la gastronomie du Sud-ouest et y apporte sa créativité. Ici on défend le goût et les producteurs de nos régions.",
        imagePath: "tutiac"
    ),
    PlaceData2(
        name: "Maison Nouvelle",
        cookStyle: .fineDining,
        description: "Bienvenue chez Etxe Beste (maison nouvelle en basque) !",
        imagePath: "maison-nouvelle"
    ),
    PlaceData2(
        name: "Le Quatrieme Mur",
        cookStyle: .fineDining,
        description: "Installé dans le Grand Théâtre de Bordeaux, ce restaurant sert une cuisine de saison raffinée dans un cadre élégant et lumineux.",
        imagePath: "quatrieme-mur"
    ),
    PlaceData2(
        name: "Daily-D",
        cookStyle: .fastfood,
        description: "Sandwicherie préférée de Yannick Nay",
        imagePath: "daily-d"
    )
]

