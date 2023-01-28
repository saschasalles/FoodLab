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
        .init(
            placeId: UUID(),
            title: "Tutiac, Le Bistro des Vignerons",
            content: "Notre jeune chef s’inspire des classiques de la gastronomie du Sud-ouest et y apporte sa créativité. Ici on défend le goût et les producteurs de nos régions.",
            imagePaths: ["tutiac"],
            rate: 9
        ),
        .init(
            placeId: UUID(),
            title: "Maison Nouvelle",
            content: "Bienvenue chez Etxe Beste (maison nouvelle en basque) !",
            imagePaths: ["maison-nouvelle"],
            rate: 8
        ),
        .init(
            placeId: UUID(),
            title: "Le Quatrieme Mur",
            content: "Installé dans le Grand Théâtre de Bordeaux, ce restaurant sert une cuisine de saison raffinée dans un cadre élégant et lumineux.",
            imagePaths: ["quatrieme-mur"],
            rate: 7
        ),
        .init(
            placeId: UUID(),
            title: "Daily-D",
            content: "Sandwicherie préférée de Yannick Nay",
            imagePaths: ["daily-d"],
            rate: 10
        )
    ]
}

extension Review: Equatable, Hashable {}
