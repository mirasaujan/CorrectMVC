//
//  PostDetailScreen.swift
//  MemeLogUITests
//
//  Created by Miras Karazhigitov on 11.03.2022.
//

import XCTest

class PostDetailScreen {
    private let app = XCUIApplication()

    var titleLabel: XCUIElement {
        app.staticTexts["title_label"]
    }

    var titleLabelText: String {
        titleLabel.title
    }

    func toggleFavoriteButton() {
        app.navigationBars.buttons["favorite_navigation_button"].tap()
    }

    func tapBackButton() {
        app.navigationBars.buttons.element(boundBy: 0).tap()
    }
}
