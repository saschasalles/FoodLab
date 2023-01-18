//
//  FavoritesViewController.swift
//  FoodLab
//
//  Created by Sascha Sallès on 17/01/2023.
//

import UIKit


final class FavoritesViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = TabItem.favs.title
    }
}

