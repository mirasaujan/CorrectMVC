//
//  LaunchCoordinator.swift
//  CorrectMVC
//
//  Created by Miras Karazhigitov on 07.03.2022.
//

import UIKit

final class LaunchCoordinator {
    private var browseCoordinator: BrowseCoordinator!
    private var favoriteCoordinator: FavoriteCoordinator!
    private let tb = UITabBarController()

    func start(window: UIWindow?) {
        window?.rootViewController = tb

        tb.viewControllers = [browse(), favorite()]
    }

    private func browse() -> UIViewController {
        let browseNC = UINavigationController()
        browseNC.tabBarItem = UITabBarItem(
            title: "Browse",
            image: UIImage(systemName: "flame.circle"),
            selectedImage: UIImage(systemName: "flame.circle.fill")
        )
        browseCoordinator = BrowseCoordinator(navigationController: browseNC)
        browseCoordinator.start()

        return browseNC
    }

    private func favorite() -> UIViewController {
        let favoriteNC = UINavigationController()
        favoriteNC.tabBarItem = UITabBarItem(
            title: "Favorite",
            image: UIImage(systemName: "suit.heart"),
            selectedImage: UIImage(systemName: "suit.heart.fill")
        )
        favoriteCoordinator = FavoriteCoordinator(navigationController: favoriteNC)
        favoriteCoordinator.start()

        return favoriteNC
    }
}
