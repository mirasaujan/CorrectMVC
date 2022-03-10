//
//  MockPostListStorage.swift
//  CorrectMVCTests
//
//  Created by Miras Karazhigitov on 09.03.2022.
//

import CorrectMVC
import UIKit
import Combine

class MockPostListStorage: PostListStorage {
    var list: CurrentValueSubject<[Post], Never>

    var fetchCallCounter = 0
    var containsCallCounter = 0
    var addCallCounter = 0
    var removeCallCounter = 0

    init(initialValue: [Post]) {
        self.list = CurrentValueSubject(initialValue)
    }

    func fetch() {
        fetchCallCounter += 1
    }

    func contains(id: String) -> Bool {
        containsCallCounter += 1

        return list.value.contains(where: { $0.id == id })
    }

    func add(post: Post) {
        list.value.append(post)
        addCallCounter += 1
    }

    func remove(postID: String) {
        list.value = list.value.filter { $0.id != postID }
        removeCallCounter += 1
    }
}

