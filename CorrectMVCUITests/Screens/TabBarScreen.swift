//
//  TabBarScreen.swift
//  CorrectMVCUITests
//
//  Created by Miras Karazhigitov on 11.03.2022.
//

import XCTest

class TabBarScreen {
    private let app = XCUIApplication()

    func goToFavoriteTab() {
        app.tabBars.buttons.element(boundBy: 1).tap()
    }
}

