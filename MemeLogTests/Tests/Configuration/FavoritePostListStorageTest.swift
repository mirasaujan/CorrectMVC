//
//  FavoritePostListStorageTest.swift
//  MemeLogTests
//
//  Created by Miras Karazhigitov on 09.03.2022.
//

import XCTest
@testable import MemeLog

class FavoritePostListStorageTest: XCTestCase {
    var favoriteStorage: FavoritePostListStorage!
    var defaults: UserDefaults!

    override func setUp() {
        defaults = UserDefaults.createMock()
        favoriteStorage = FavoritePostListStorage(storage: defaults)
    }

    func testEmptyList() async throws {
        // When
        favoriteStorage.fetch()

        // Then
        XCTAssertEqual(favoriteStorage.list.value, [])
    }

    func testAdd() async throws {
        // Given
        favoriteStorage.fetch()

        // When
        favoriteStorage.add(post: Post.stub1)

        // Then
        XCTAssertEqual(favoriteStorage.list.value, [Post.stub1])
    }

    func testRemoveAfterAdd() async throws {
        // Given
        favoriteStorage.fetch()
        favoriteStorage.add(post: Post.stub1)

        // When
        favoriteStorage.remove(postID: Post.stub1.id)

        // Then
        XCTAssertEqual(favoriteStorage.list.value, [])
    }

    func testRemoveEmptyList() async throws {
        // Given
        favoriteStorage.fetch()

        // When
        favoriteStorage.remove(postID: Post.stub1.id)

        // Then
        XCTAssertEqual(favoriteStorage.list.value, [])
    }

    func testContainsPostAfterAdd() async throws {
        // Given
        favoriteStorage.fetch()

        // When
        favoriteStorage.add(post: Post.stub1)

        // Then
        XCTAssertTrue(favoriteStorage.contains(id: Post.stub1.id))
    }

    func testContainsPostEmpty() async throws {
        // Given
        favoriteStorage.fetch()

        // Then
        XCTAssertFalse(favoriteStorage.contains(id: Post.stub1.id))
    }
}
