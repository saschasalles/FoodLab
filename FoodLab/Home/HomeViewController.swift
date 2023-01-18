//
//  HomeViewController.swift
//  FoodLab
//
//  Created by Sascha Sallès on 17/01/2023.
//

import UIKit

final class HomeViewController: UIViewController {

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
        navigationItem.title = TabItem.home.title
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            primaryAction: nil,
            menu: makeMenu()
        )
        navigationItem.rightBarButtonItem?.tintColor = .tintColor
    }

    private func makeMenu() -> UIMenu {
        let actions: [UIAction] = [
            UIAction(
                title: "Add New Place",
                handler: { [weak self] _ in

                }
            ),
            UIAction(
                title: "Add New Review",
                handler: { [weak self] _ in

                }
            )
        ]

        let menu = UIMenu(
            image: nil,
            children: actions
        )

        return menu
    }
}

