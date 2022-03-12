//
//  DeeplinkRegistry.swift
//  CorrectMVC
//
//  Created by Miras Karazhigitov on 12.03.2022.
//

import Foundation

class DeeplinkRegistry {
    private var deeplinks = [Deeplink]()

    func register(deeplink: Deeplink) {
        deeplinks.append(deeplink)
    }

    func handle(url: URL) {
        if let deeplink = deeplinks.first(where: { $0.type == url.host }) {
            deeplink.proccess()
        }
    }

    static let shared = DeeplinkRegistry()
}
