//
//  FavoriteScreen.swift
//  MemeLogUITests
//
//  Created by Miras Karazhigitov on 11.03.2022.
//

import XCTest

class FavoriteScreen {
    private let app = XCUIApplication()

    var isEmpty: Bool {
        app.cells.count == 0
    }

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

