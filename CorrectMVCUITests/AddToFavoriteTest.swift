//
//  AddToFavoriteTest.swift
//  CorrectMVCUITests
//
//  Created by Miras Karazhigitov on 10.03.2022.
//

import XCTest

class AddToFavoriteTest: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments += ["UI-Test"]
        app.launch()
    }

    func testAddToFavorite() throws {
        let browseCell = app.cells["post_list_cell"].firstMatch
        let browseCellTitle = browseCell.title
        browseCell.tap()

        let detailTitle = app.staticTexts["title_label"].title
        XCTAssertEqual(browseCellTitle, detailTitle)

        app.navigationBars.buttons["favorite_navigation_button"].tap()
        app.navigationBars.buttons.element(boundBy: 0).tap()
        app.tabBars.buttons.element(boundBy: 1).tap()

        let favoriteCell = app.cells["post_list_cell"].firstMatch
        let favoriteCellTitle = favoriteCell.title
        XCTAssertEqual(favoriteCellTitle, browseCellTitle)
    }
}
