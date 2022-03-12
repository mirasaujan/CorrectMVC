//
//  PostDetailController.swift
//  MemeLog
//
//  Created by Miras Karazhigitov on 07.03.2022.
//

import UIKit
import Combine

final class PostDetailController: BaseViewController<PostDetailModel, PostDetailView> {
    private var bag = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()

        typeSafeView.configure(viewModel: model.createViewModel())
        createFavoriteNavBar(isFavorite: model.isFavorite.value)
        model.isFavorite
            .sink { [weak self] isFavorite in
                self?.createFavoriteNavBar(isFavorite: isFavorite)
            }
            .store(in: &bag)
    }

    private func createFavoriteNavBar(isFavorite: Bool) {
        let button = UIBarButtonItem(
            image: UIImage(systemName: isFavorite ? "star.fill" : "star"),
            style: .plain,
            target: self,
            action: #selector(favoriteTap)
        )

        button.accessibilityLabel = "favorite_navigation_button"
        navigationItem.rightBarButtonItem = button
    }

    @objc private func favoriteTap() {
        model.toggleFavorite()
    }
}
