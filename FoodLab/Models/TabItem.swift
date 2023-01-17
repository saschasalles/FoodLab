//
//  TabItem.swift
//  FoodLab
//
//  Created by Sascha Sallès on 17/01/2023.
//

import UIKit

enum TabItem: Int, CaseIterable {
    case home
    case add

    var navigationController: UINavigationController {
        switch self {
        case .home:
            return makeNavigationViewController(
                rootViewController: HomeViewController()
            )
        case .add:
            return makeNavigationViewController(
                rootViewController: AddReviewFormViewController()
            )
        }
    }

    var title: String {
        switch self {
        case .home:     return "Home"
        case .add:      return "Add"
        }
    }

    var image: UIImage? {
        switch self {
        case .home:     return UIImage(systemName: "house.fill")
        case .add:      return UIImage(systemName: "star.square.fill")
        }
    }

    private func makeNavigationViewController(
        rootViewController: UIViewController
    ) -> UINavigationController {
        let navVC = UINavigationController(
            rootViewController: rootViewController
        )
        navVC.tabBarItem = UITabBarItem(title: title, image: image, tag: rawValue)
        return navVC
    }
}
