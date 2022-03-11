//
//  AddToFavoriteTest.swift
//  CorrectMVCUITests
//
//  Created by Miras Karazhigitov on 10.03.2022.
//

import XCTest

class RemoveFromFavoriteTest: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments += ["UI-Test"]
        app.launch()
    }

    func testRemoteFromFavorite() {
        let browseScreen = BrowseScreen()
        let browseCellTitle = browseScreen.firestCellTitle
        browseScreen.tapOnFirstCell()

        let detailScreen = PostDetailScreen()
        let detailTitle = detailScreen.titleLabelText
        XCTAssertEqual(browseCellTitle, detailTitle)

        detailScreen.toggleFavoriteButton()
        detailScreen.tapBackButton()

        let tabBar = TabBarScreen()
        tabBar.goToFavoriteTab()

        let favoriteScreen = FavoriteScreen()
        let favoriteCellTitle = favoriteScreen.firestCellTitle
        XCTAssertEqual(favoriteCellTitle, browseCellTitle)

        favoriteScreen.tapOnFirstCell()
        detailScreen.toggleFavoriteButton()
        detailScreen.tapBackButton()
        XCTAssertTrue(favoriteScreen.isEmpty)
    }
}
