//
//  PostDetailModel.swift
//  MemeLog
//
//  Created by Miras Karazhigitov on 07.03.2022.
//

import Foundation
import Combine

final class PostDetailModel {
    struct Context {
        let post: Post
    }

    struct Dependency {
        let storage: PostListStorage
    }

    let context: Context
    let dep: Dependency
    var isFavorite: CurrentValueSubject<Bool, Never>!

    init(context: Context, dep: Dependency) {
        self.context = context
        self.dep = dep

        dep.storage.fetch()
        isFavorite = CurrentValueSubject(dep.storage.contains(id: context.post.id))
    }

    func createViewModel() -> PostDetailView.ViewModel {
        switch context.post.type {
        case .image(let url):
            return PostDetailView.ViewModel(imageURL: url, title: context.post.title ?? "")
        case .text(let text):
            return PostDetailView.ViewModel(imageURL: URL(fileURLWithPath: text), title: context.post.title ?? "")
        }
    }

    func toggleFavorite() {
        if dep.storage.contains(id: context.post.id) {
            dep.storage.remove(postID: context.post.id)
        } else {
            dep.storage.add(post: context.post)
        }

        isFavorite.send(dep.storage.contains(id: context.post.id))
    }
}
