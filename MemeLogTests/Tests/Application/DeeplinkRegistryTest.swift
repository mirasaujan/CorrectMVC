//
//  DeeplinkRegistryTest.swift
//  MemeLogTests
//
//  Created by Miras Karazhigitov on 12.03.2022.
//

@testable import MemeLog
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
        deeplinkRegistry.handle(url: URL(string: "MemeLog://" + type)!)

        XCTAssertEqual(deeplink.processCallCounter, 1)
    }
}
