//
//  BrowseCoordinatorFlow.swift
//  CorrectMVC
//
//  Created by Miras Karazhigitov on 10.03.2022.
//

import UIKit

protocol BrowseCoordinatorFlowProtocol {
    func postListViewController(onSelect: @escaping (Post) -> Void) -> UIViewController
    func postDetailViewController(post: Post) -> UIViewController
}

final class BrowseCoordinatorFlow: BrowseCoordinatorFlowProtocol {
    func postListViewController(onSelect: @escaping (Post) -> Void) -> UIViewController {
        let context = PostListAssembly.Context(
            title: "Browse") { post in
                onSelect(post)
            }
        let assembly = PostListAssembly(context: context, dep: PostListAssembly.Dependency(provider: RedditPostListProvider(apiClient: RedditAPI())))

        return assembly.create()
    }

    func postDetailViewController(post: Post) -> UIViewController {
        let assembly = PostDetailAssembly(
            context: PostDetailAssembly.Context(post: post),
            dep: PostDetailAssembly.Dependency(storage: FavoritePostListStorage())
        )

        return assembly.create()
    }
}
