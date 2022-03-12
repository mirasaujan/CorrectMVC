//
//  MockDeeplink.swift
//  MemeLogTests
//
//  Created by Miras Karazhigitov on 12.03.2022.
//

import MemeLog

class MockDeeplink: Deeplink {
    let type: DeeplinkType
    var processCallCounter = 0

    init(type: DeeplinkType) {
        self.type = type
    }

    func proccess() {
        processCallCounter += 1
    }
}
