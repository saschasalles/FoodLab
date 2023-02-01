//
//  HomeItem.swift
//  FoodLab
//
//  Created by Sascha Sallès on 23/01/2023.
//

import UIKit

struct HomeItem: Hashable, Identifiable {
    let id = UUID()

    let title: String
    let subtitle: String?
    let imagePath: String?
}
