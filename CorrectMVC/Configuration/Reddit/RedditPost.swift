//
//  RedditPost.swift
//  CorrectMVC
//
//  Created by Miras Karazhigitov on 07.03.2022.
//

import Foundation

public struct RedditPost: Decodable {
    let title: String
    let name: String
    let id: String
    let url: String

    public init(title: String, name: String, id: String, url: String) {
        self.title = title
        self.name = name
        self.id = id
        self.url = url
    }
}

extension RedditPost: Equatable {
    public static func == (lhs: RedditPost, rhs: RedditPost) -> Bool {
        lhs.name == rhs.name
    }
}

extension RedditPost: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

extension RedditPost {
    var isImage: Bool {
        fullImageUrl != nil
    }

    var fullImageUrl: String? {
        url.hasSuffix(".jpg") || url.hasSuffix(".png") ? url : nil
    }
}
