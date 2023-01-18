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

    // MARK: - Menu

    private let menuImage = UIImage(systemName: "plus.circle")

    private func makeMenu() -> UIMenu {
        let actions: [UIAction] = [
            UIAction(
                title: "Add New Place",
                image: UIImage(systemName: "mappin"),
                handler: {_ in self.showModal()}
            ),
            UIAction(
                title: "Add New Review",
                image: UIImage(systemName: "list.bullet.clipboard"),
                handler: {_ in self.showModal()}
            )
        ]

        let menu = UIMenu(
            title: "",
            image: nil,
            children: actions
        )

        return menu
    }

    private func setBarButtonItem() {
        let item = UIBarButtonItem(
            image: menuImage,
            primaryAction: nil,
            menu: makeMenu()
        )

        navigationItem.rightBarButtonItem = item
    }


    // MARK: - Modal

    func showModal() {
        let placeModalViewController = AddPlaceViewController()
        present(placeModalViewController, animated: true)
    }

    // MARK: - Exposed Methods


    // MARK: - Private Properties

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.layer.cornerCurve = .continuous
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    // MARK: - TableView

    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CustomTableViewCell.self,
                       forCellReuseIdentifier: CustomTableViewCell.identifier)
        return table
    }()

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .gray
        navigationItem.title = TabItem.home.title
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        setBarButtonItem()
    }

    // MARK: - Override

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

// MARK: DataSource && Delegate

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Place.all.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CustomTableViewCell.identifier,
            for: indexPath) as? CustomTableViewCell else {
                return UITableViewCell()
            }

        let index: Place = Place.all[indexPath.row]
        let placeName: String = index.name
        let placeImage: String = index.imagePath

        cell.configure(text: placeName, imageName: placeImage)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

