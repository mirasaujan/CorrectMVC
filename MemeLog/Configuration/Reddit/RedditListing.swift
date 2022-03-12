//
//  RedditListing.swift
//  MemeLog
//
//  Created by Miras Karazhigitov on 07.03.2022.
//

import Foundation

public struct RedditListing: Decodable {
    let data: ListingData
    var posts: [RedditPost] {
        data.children.map { $0.data }
    }

    public init(data: ListingData) {
        self.data = data
    }

    public struct ListingData: Decodable {
        let children: [PostData]

        public init(children: [PostData]) {
            self.children = children
        }

        public struct PostData: Decodable {
            let data: RedditPost

            public init(data: RedditPost) {
                self.data = data
            }
        }
    }
}
