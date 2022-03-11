//
//  BrowseScreen.swift
//  CorrectMVCUITests
//
//  Created by Miras Karazhigitov on 11.03.2022.
//

import XCTest

class BrowseScreen {
    private let app = XCUIApplication()

    var firstCell: XCUIElement {
        app.cells["post_list_cell"].firstMatch
    }

    var firestCellTitle: String {
        firstCell.title
    }

    func tapOnFirstCell() {
        firstCell.tap()
    }
}
