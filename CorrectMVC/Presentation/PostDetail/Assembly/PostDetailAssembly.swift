//
//  PostDetailAssembly.swift
//  CorrectMVC
//
//  Created by Miras Karazhigitov on 07.03.2022.
//

import UIKit

class PostDetailAssembly {
    struct Context {
        let post: Post
    }

    struct Dependency {
        let storage: FavoritePostListStorage
    }

    let context: Context
    let dep: Dependency

    init(context: Context, dep: Dependency) {
        self.context = context
        self.dep = dep
    }

    func create() -> UIViewController {
        let context = PostDetailModel.Context(post: context.post)
        let dep = PostDetailModel.Dependency(storage: dep.storage)
        let controler = PostDetailController(model: PostDetailModel(context: context, dep: dep), view: PostDetailView())
        controler.title = "Detail"
        controler.hidesBottomBarWhenPushed = true
        return controler
    }
}
