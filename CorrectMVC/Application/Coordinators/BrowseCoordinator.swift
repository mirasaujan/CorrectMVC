//
//  BrowseCoordinator.swift
//  CorrectMVC
//
//  Created by Miras Karazhigitov on 07.03.2022.
//

import UIKit

final class BrowseCoordinator {
    var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        navigationController?.viewControllers = [postListViewController()]
    }


    private func postListViewController() -> UIViewController {
        let context = PostListAssembly.Context(
            title: "Browse") { [weak self] post in
                guard let self = self else { return }
                self.navigationController?.pushViewController(self.postDetailViewController(post: post), animated: true)
            }
        let assembly = PostListAssembly(context: context, dep: PostListAssembly.Dependency(provider: MockPostListProvider()))

        return assembly.create()
    }

    private func postDetailViewController(post: Post) -> UIViewController {
        let assembly = PostDetailAssembly(
            context: PostDetailAssembly.Context(post: post),
            dep: PostDetailAssembly.Dependency(storage: FavoritePostListStorage())
        )
        
        return assembly.create()
    }
}
