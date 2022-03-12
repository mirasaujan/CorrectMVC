//
//  LaunchCoordinator.swift
//  CorrectMVC
//
//  Created by Miras Karazhigitov on 07.03.2022.
//

import UIKit

final class LaunchCoordinator {
    enum Option {
        case browse
        case favorite
    }

    private var browseCoordinator: BrowseCoordinator!
    private var favoriteCoordinator: FavoriteCoordinator!
    private let tb = UITabBarController()

    init(window: UIWindow?) {
        window?.rootViewController = tb
        window?.makeKeyAndVisible()
    }

    func start(_ option: Option = .browse) {
        let browseVC = browse()
        let favoriteVC = favorite()
        tb.viewControllers = [browseVC, favoriteVC]
        switch option {
        case .browse:
            tb.selectedViewController = browseVC
            tb.selectedIndex = 0
        case .favorite:
            tb.selectedViewController = favoriteVC
            tb.selectedIndex = 1
        }
    }

    private func browse() -> UIViewController {
        let browseNC = UINavigationController()
        browseNC.tabBarItem = UITabBarItem(
            title: "Browse",
            image: UIImage(systemName: "flame.circle"),
            selectedImage: UIImage(systemName: "flame.circle.fill")
        )
        browseCoordinator = BrowseCoordinator(navigationController: browseNC, flow: BrowseCoordinatorFlow())
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
        favoriteCoordinator = FavoriteCoordinator(navigationController: favoriteNC, flow: FavoriteCoordinatorFlow())
        favoriteCoordinator.start()

        return favoriteNC
    }
}
