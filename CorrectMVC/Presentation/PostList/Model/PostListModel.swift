//
//  PostListModel.swift
//  CorrectMVC
//
//  Created by Miras Karazhigitov on 06.03.2022.
//

import Foundation

extension PostListModel {
    enum State {
        case list([Post])
        case error(Error)
    }

    struct Dependency {
        let provider: PostListProvider
    }
}

final class PostListModel {
    let dep: Dependency

    @Published var state: State = .list([])

    var onItemSelect: ((Post) -> Void)?

    init(dep: Dependency) {
        self.dep = dep
    }

    func fetchPosts() {
        Task {
            do {
                let posts = try await dep.provider.fetch()
                state = .list(posts)
            } catch let error {
                state = .error(error)
            }
        }
    }
}
