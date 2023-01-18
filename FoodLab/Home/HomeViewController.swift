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

    private let plusImage = UIImage(systemName: "plus")

    private func setBarButtonItem() {
        let item = UIBarButtonItem(
            image: plusImage,
            primaryAction: nil,
            menu: makeMenu())

        navigationItem.rightBarButtonItem = item

    }

    private func makeMenu() -> UIMenu {
        let actions: [UIAction] = [
            UIAction(
                title: "Add New Place",
                image: UIImage(systemName: "mappin"),
                handler: {[weak self] _ in

                    let viewControllerToPresent = AddPlaceViewController()
                    self?.present(viewControllerToPresent, animated: true, completion: nil)

            }),
            UIAction(
                title: "Add New Review",
                image: UIImage(systemName: "list.bullet.clipboard"),
                handler: {[weak self] _ in

            })
        ]

        let menu = UIMenu(
            children: actions
            )

        return menu
    }

    // MARK: - Exposed Methods

    // MARK: - Private Properties

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .systemGroupedBackground
        navigationItem.title = TabItem.home.title
        navigationController?.navigationBar.prefersLargeTitles = true
        setBarButtonItem()
    }
}
