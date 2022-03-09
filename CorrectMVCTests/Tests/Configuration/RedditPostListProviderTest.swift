//
//  RedditPostListProviderTest.swift
//  CorrectMVCTests
//
//  Created by Miras Karazhigitov on 09.03.2022.
//

import XCTest
@testable import CorrectMVC

class RedditPostListProviderTest: XCTestCase {
    var provider: RedditPostListProvider!
    let response = RedditListing.stub1

    override func setUp() {
        let client = MockRedditAPI(response: response)
        provider = RedditPostListProvider(apiClient: client)
    }

    func testMemesFetch() async throws {
        // Given
        let verificationPosts = response.posts.map {
            Post(id: $0.id, title: $0.title, type: .image(URL(string: $0.url)!))
        }

        // When
        let list = try await provider.fetch()

        // Then

        XCTAssertEqual(list, verificationPosts)
    }
}

