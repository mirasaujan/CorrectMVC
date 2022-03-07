//
//  FavoritePostListStorage.swift
//  CorrectMVC
//
//  Created by Miras Karazhigitov on 07.03.2022.
//

import Foundation
import Combine

final class FavoritePostListStorage: PostListStorage {
    var list: CurrentValueSubject<[Post], Never>

    private let storage: UserDefaults
    private var bag = Set<AnyCancellable>()

    init(storage: UserDefaults = UserDefaults.standard) {
        self.storage = storage
        self.list = CurrentValueSubject([])
    }

    func fetch() {
        if let savedPostList = storage.object(forKey: "favorite_storage") as? Data {
            if let list = try? JSONDecoder().decode([Post].self, from: savedPostList) {
                self.list.value = list
            }
        }

        list
            .sink { [weak self] postList in
                if let encoded = try? JSONEncoder().encode(postList) {
                    self?.storage.set(encoded, forKey: "favorite_storage")
                }
            }
            .store(in: &bag)
    }

    func contains(id: String) -> Bool {
        list.value.contains(where: { $0.id == id })
    }

    func add(post: Post) {
        list.value.append(post)
    }

    func remove(postID: String) {
        list.value = list.value.filter { $0.id != postID }
    }
}
