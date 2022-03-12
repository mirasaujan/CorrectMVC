//
//  MockPostListProvider.swift
//  MemeLog
//
//  Created by Miras Karazhigitov on 06.03.2022.
//

import MemeLog
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
