//
//  Post.swift
//  CorrectMVC
//
//  Created by Miras Karazhigitov on 07.03.2022.
//

import Foundation

public struct Post: Codable, Equatable {
    let id: String
    let title: String?
    let type: PostType

    public init(id: String, title: String?, type: PostType) {
        self.id = id
        self.title = title
        self.type = type
    }

    public static func == (lhs: Post, rhs: Post) -> Bool {
        lhs.id == rhs.id
    }
}

public extension Post {
    enum PostType: Codable {
        case image(URL)
        case text(String)
    }
}
