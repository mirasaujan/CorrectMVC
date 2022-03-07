//
//  RedditListing.swift
//  CorrectMVC
//
//  Created by Miras Karazhigitov on 07.03.2022.
//

import Foundation

struct RedditListing: Decodable {
    let data: ListingData
    var posts: [RedditPost] {
        data.children.map { $0.data }
    }

    struct ListingData: Decodable {
        let children: [PostData]

        struct PostData: Decodable {
            let data: RedditPost
        }
    }
}

