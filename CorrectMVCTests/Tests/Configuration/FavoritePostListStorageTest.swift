//
//  FavoritePostListStorageTest.swift
//  CorrectMVCTests
//
//  Created by Miras Karazhigitov on 09.03.2022.
//

import XCTest
@testable import CorrectMVC

class FavoritePostListStorageTest: XCTestCase {
    var favoriteStorage: FavoritePostListStorage!

    func testEmptyList() async throws {
        // Given
        let defaults = UserDefaults.createMock()
        favoriteStorage = FavoritePostListStorage(storage: defaults)

        // When
        favoriteStorage.fetch()

        // Then
        XCTAssertEqual(favoriteStorage.list.value, [])
    }

    func testAdd() async throws {
        // Given
        let defaults = UserDefaults.createMock()
        favoriteStorage = FavoritePostListStorage(storage: defaults)
        favoriteStorage.fetch()

        // When
        favoriteStorage.add(post: Post.mock1)

        // Then
        XCTAssertEqual(favoriteStorage.list.value, [Post.mock1])
    }

    func testRemoveAfterAdd() async throws {
        // Given
        let defaults = UserDefaults.createMock()
        favoriteStorage = FavoritePostListStorage(storage: defaults)
        favoriteStorage.fetch()
        favoriteStorage.add(post: Post.mock1)

        // When
        favoriteStorage.remove(postID: Post.mock1.id)

        // Then
        XCTAssertEqual(favoriteStorage.list.value, [])
    }

    func testRemoveEmptyList() async throws {
        // Given
        let defaults = UserDefaults.createMock()
        favoriteStorage = FavoritePostListStorage(storage: defaults)
        favoriteStorage.fetch()

        // When
        favoriteStorage.remove(postID: Post.mock1.id)

        // Then
        XCTAssertEqual(favoriteStorage.list.value, [])
    }

    func testContainsPostAfterAdd() async throws {
        // Given
        let defaults = UserDefaults.createMock()
        favoriteStorage = FavoritePostListStorage(storage: defaults)
        favoriteStorage.fetch()

        // When
        favoriteStorage.add(post: Post.mock1)

        // Then
        XCTAssertTrue(favoriteStorage.contains(id: Post.mock1.id))
    }

    func testContainsPostEmpty() async throws {
        // Given
        let defaults = UserDefaults.createMock()
        favoriteStorage = FavoritePostListStorage(storage: defaults)
        favoriteStorage.fetch()

        // Then
        XCTAssertFalse(favoriteStorage.contains(id: Post.mock1.id))
    }
}
