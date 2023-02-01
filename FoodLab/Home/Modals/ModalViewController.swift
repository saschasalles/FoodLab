//
//  ModalViewController.swift
//  FoodLab
//
//  Created by Antoine Lucchini on 28/01/2023.
//

import UIKit

class ModalViewController: UIViewController {

    // MARK: - Methods

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        navigationItem.title = getModalTitle()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }

    override func viewDidDisappear(_ animated: Bool) {
        HomeModals.addPlaceTemplate.changeChoosed(false)
        HomeModals.addReviewTemplate.changeChoosed(false)
    }

    private func getModalTitle() -> String{
        if(HomeModals.addPlaceTemplate.isChoosed){
            return HomeModals.addPlaceTemplate.modalTitle
        }else{
            return HomeModals.addReviewTemplate.modalTitle
        }
    }

    // MARK: - TableView

    private lazy var tableView: UITableView = {
        let tableView = UITableView(
            frame: .zero,
            style: .insetGrouped
        )

        tableView.register(
            TitlePlaceNameUITableViewCell.self,
            forCellReuseIdentifier: TitlePlaceNameUITableViewCell.reuseIdentifier)

        tableView.register(
            ContentDescriptionTableViewCell.self,
            forCellReuseIdentifier: ContentDescriptionTableViewCell.reuseIdentifier)

        tableView.register(
            AddPlaceReviewButtonTableViewCell.self,
            forCellReuseIdentifier: AddPlaceReviewButtonTableViewCell.reuseIdentifier)

        tableView.register(
            AddPhotoTableViewCell.self,
            forCellReuseIdentifier: AddPhotoTableViewCell.reuseIdentifier)

        tableView.dataSource = self
        tableView.delegate = self

        return tableView
    }()
}


// MARK: DataSource && Delegate

extension ModalViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 0){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TitlePlaceNameUITableViewCell.reuseIdentifier) else {
                return UITableViewCell()
            }
            return cell
        }
        if (indexPath.row == 1){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ContentDescriptionTableViewCell.reuseIdentifier) else {
                return UITableViewCell()
            }
            return cell
        }
        if (indexPath.row == 2){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AddPhotoTableViewCell.reuseIdentifier) else {
                return UITableViewCell()
            }
            return cell
        }
        else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AddPlaceReviewButtonTableViewCell.reuseIdentifier) else {
                return UITableViewCell()
            }
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return getModalTitle()
    }
}
