//
//  MockRedditAPI.swift
//  MemeLogTests
//
//  Created by Miras Karazhigitov on 09.03.2022.
//

import MemeLog
import Combine

class MockRedditAPI: RedditAPIProtocol {
    let listing: RedditListing

    init(response: RedditListing) {
        self.listing = response
    }

    func memesFeed() -> AnyPublisher<RedditListing, Error> {
        return Future { [weak self] promise in
            guard let self = self else {
                promise(.success(.stub1))
                return
            }

            promise(.success(self.listing))
        }
        .eraseToAnyPublisher()
    }
}
