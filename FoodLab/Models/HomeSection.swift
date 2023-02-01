//
//  HomeSection.swift
//  FoodLab
//
//  Created by Sascha Sallès on 23/01/2023.
//

import Foundation

enum HomeSection: Int, Hashable {
    case grid
    case list
    
    var columnCount: Int {
        switch self {
        case .list:
            return 1
        case .grid:
            return 2
        }
    }

    var title: String {
        switch self {
        case .grid:     return "Last Reviews"
        case .list:     return "Last Places"
        }
    }
}
