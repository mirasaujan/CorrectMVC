//
//  PostListStorage.swift
//  CorrectMVC
//
//  Created by Miras Karazhigitov on 07.03.2022.
//

import Foundation
import Combine

public protocol PostListStorage {
    var list: CurrentValueSubject<[Post], Never> { get }
    func fetch()

    func contains(id: String) -> Bool
    func add(post: Post)
    func remove(postID: String)
}
