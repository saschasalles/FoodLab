//
//  HomeViewController.swift
//  FoodLab
//
//  Created by Sascha Sallès on 17/01/2023.
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Exposed Properties


    // MARK: - Exposed Methods


    // MARK: - Private Properties


    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .systemGroupedBackground
        navigationItem.title = TabItem.home.title
    }
}

