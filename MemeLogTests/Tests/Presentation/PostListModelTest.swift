//
//  PostListModelTest.swift
//  MemeLogTests
//
//  Created by Miras Karazhigitov on 09.03.2022.
//

@testable import MemeLog
import XCTest

class PostListModelTest: XCTestCase {
    var postListModel: PostListModel!
    let response = [Post].stub1
    
    override func setUpWithError() throws {
        let dep = PostListModel.Dependency(provider: MockPostListProvider(response: response))
        postListModel = PostListModel(dep: dep)
    }

    func testFetch() {
        // When
        postListModel.fetchPosts()

        // Then
        let expectation = XCTestExpectation()
        let _ = XCTWaiter.wait(for: [expectation], timeout: 1)

        switch postListModel.state {
        case .list(let posts):
            XCTAssertEqual(posts, response)
        default:
            XCTFail("not correct state")
        }
    }
}
