//
//  Post.swift
//  CorrectMVC
//
//  Created by Miras Karazhigitov on 07.03.2022.
//

import Foundation

struct Post: Codable {
    let id: String
    let title: String?
    let type: PostType
}

extension Post {
    enum PostType: Codable {
        case image(URL)
        case text(String)
    }
}
