//
//  PostListAssembly.swift
//  CorrectMVC
//
//  Created by Miras Karazhigitov on 07.03.2022.
//

import UIKit

class PostListAssembly {
    struct Context {
        let title: String
        let onItemSelect: ((Post) -> Void)?
    }

    struct Dependency {
        let provider: PostListProvider
    }

    let context: Context
    let dep: Dependency

    init(context: Context, dep: Dependency) {
        self.context = context
        self.dep = dep
    }

    func create() -> UIViewController {
        let dep = PostListModel.Dependency(provider: dep.provider)
        let model = PostListModel(dep: dep)
        model.onItemSelect = { [context] post in
            context.onItemSelect?(post)
        }

        let controller = PostListController(
            model: model,
            view: PostListView()
        )
        controller.title = context.title

        return controller
    }
}
