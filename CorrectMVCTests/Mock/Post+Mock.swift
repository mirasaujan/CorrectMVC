//
//  PostMock.swift
//  CorrectMVCTests
//
//  Created by Miras Karazhigitov on 09.03.2022.
//

import CorrectMVC
import Foundation

extension Post {
    static let mock1 = Post(
        id: "1",
        title: "Hello",
        type: .image(URL(string: "https://i.redd.it/y5q2ylf36gm61.jpg")!)
    )

    static let mock2 = Post(
        id: "2",
        title: "Is",
        type: .image(URL(string: "https://i.redd.it/y5q2ylf36gm61.jpg")!)
    )
}
