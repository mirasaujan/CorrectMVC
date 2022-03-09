//
//  UserDefaultsMock.swift
//  CorrectMVCTests
//
//  Created by Miras Karazhigitov on 09.03.2022.
//

import Foundation

extension UserDefaults {
    static func createMock() -> UserDefaults {
        let name = UUID().uuidString
        let defaults = UserDefaults(suiteName: name)
        defaults?.removePersistentDomain(forName: name)

        return defaults!
    }
}
