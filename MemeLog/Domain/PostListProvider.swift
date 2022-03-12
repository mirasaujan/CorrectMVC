//
//  PostProvider.swift
//  MemeLog
//
//  Created by Miras Karazhigitov on 06.03.2022.
//

import Foundation

public protocol PostListProvider {
    func fetch() async throws -> [Post]
}
