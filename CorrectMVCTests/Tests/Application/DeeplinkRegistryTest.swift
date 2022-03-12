//
//  DeeplinkRegistryTest.swift
//  CorrectMVCTests
//
//  Created by Miras Karazhigitov on 12.03.2022.
//

@testable import CorrectMVC
import XCTest

class DeeplinkRegistryTest: XCTestCase {
    var deeplinkRegistry: DeeplinkRegistry!

    override func setUp() {
        deeplinkRegistry = DeeplinkRegistry()
    }

    func testDeeplinkRegistration() {
        let type = "mock"
        let deeplink = MockDeeplink(type: type)
        deeplinkRegistry.register(deeplink: deeplink)
        deeplinkRegistry.handle(url: URL(string: "correctMVC://" + type)!)

        XCTAssertEqual(deeplink.processCallCounter, 1)
    }
}
