//
//  FavoriteDeeplink.swift
//  CorrectMVC
//
//  Created by Miras Karazhigitov on 12.03.2022.
//

import Foundation

struct FavoriteDeeplink: Deeplink {
    var type: DeeplinkType {
        "favorite"
    }

    let coordinator: LaunchCoordinator

    func proccess() {
        coordinator.start(.favorite)
    }
}
