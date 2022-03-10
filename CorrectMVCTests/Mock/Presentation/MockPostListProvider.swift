//
//  MockPostListProvider.swift
//  CorrectMVC
//
//  Created by Miras Karazhigitov on 06.03.2022.
//

import CorrectMVC
import UIKit

class MockPostListProvider: PostListProvider {
    let response: [Post]

    init(response: [Post]) {
        self.response = response
    }

    func fetch() async throws -> [Post] {
        return response
    }
}
