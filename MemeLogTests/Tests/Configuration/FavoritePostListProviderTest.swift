//
//  FavoritePostListProviderTest.swift
//  MemeLogTests
//
//  Created by Miras Karazhigitov on 09.03.2022.
//

import XCTest
@testable import MemeLog

class FavoritePostListProviderTest: XCTestCase {
    var favoriteProvider: FavoritePostListProvider!
    var favoriteStorage: FavoritePostListStorage!
    var defaults: UserDefaults!

    override func setUp() {
        defaults = UserDefaults.createMock()
        favoriteProvider = FavoritePostListProvider(storage: defaults)
    }

    func testEmptyFavoriteProvider() async throws {
        // When
        let list = try await favoriteProvider.fetch()

        // Then
        XCTAssertEqual(list, [])
    }

    func testFavoriteProviderWithValue() async throws {
        // Given
        favoriteStorage = FavoritePostListStorage(storage: defaults)
        
        // When
        favoriteStorage.add(post: Post.stub1)
        let list = try await favoriteProvider.fetch()

        // Then
        XCTAssertEqual(list, [Post.stub1])
    }
}
