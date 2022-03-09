//
//  FavoritePostListProviderTest.swift
//  CorrectMVCTests
//
//  Created by Miras Karazhigitov on 09.03.2022.
//

import XCTest
@testable import CorrectMVC

class FavoritePostListProviderTest: XCTestCase {
    var favoriteProvider: FavoritePostListProvider!
    var favoriteStorage: FavoritePostListStorage!

    func testEmptyFavoriteProvider() async throws {
        // Given
        let defaults = UserDefaults.createMock()
        favoriteProvider = FavoritePostListProvider(storage: defaults)

        // When
        let list = try await favoriteProvider.fetch()

        // Then
        XCTAssertEqual(list, [])
    }

    func testFavoriteProviderWithValue() async throws {
        // Given
        let defaults = UserDefaults.createMock()
        favoriteProvider = FavoritePostListProvider(storage: defaults)
        favoriteStorage = FavoritePostListStorage(storage: defaults)

        // When
        favoriteStorage.add(post: Post.mock1)
        let list = try await favoriteProvider.fetch()

        // Then
        XCTAssertEqual(list, [Post.mock1])
    }
}