//
//  FavoritePostListProvider.swift
//  MemeLog
//
//  Created by Miras Karazhigitov on 07.03.2022.
//

import Foundation

class FavoritePostListProvider: PostListProvider {
    private let storage: UserDefaults

    init(storage: UserDefaults = UserDefaults.standard) {
        self.storage = storage
    }

    func fetch() async throws -> [Post] {
        if let savedPostList = storage.object(forKey: "favorite_storage") as? Data {
            if let list = try? JSONDecoder().decode([Post].self, from: savedPostList) {
                return list.reversed()
            }
        }

        return []
    }
}
