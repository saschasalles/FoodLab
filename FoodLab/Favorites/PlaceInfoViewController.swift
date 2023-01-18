//
//  PlaceInfoViewController.swift
//  FoodLab
//
//  Created by pierre on 18/01/2023.
//

import SwiftUI
import UIKit

struct PlaceInfoView: View {
    var place: Place

    var dismissAction: () -> Void

    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                Button {
                    dismissAction()
                } label: {
                    Image(systemName: "xmark")
                }
            }
            .padding()


            Image(place.imagePath)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .cornerRadius(10)

            Text(place.name)
                .font(.title)

            Text(place.description)
                .font(.headline)

            Spacer()
        }
        .background(Material.ultraThinMaterial)
    }
}

final class ProfileInfoViewController: UIViewController {

    private let place: Place

    init(place: Place) {
        self.place = place
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let hostingController = UIHostingController(
            rootView: PlaceInfoView(place: place, dismissAction: {
                self.dismiss(animated: true)
            })
        )

        let rootView = hostingController.view as UIView
        rootView.backgroundColor = .clear
        rootView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rootView)

        NSLayoutConstraint.activate([
            rootView.topAnchor.constraint(equalTo: view.topAnchor),
            rootView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            rootView.leftAnchor.constraint(equalTo: view.leftAnchor),
            rootView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }

}
