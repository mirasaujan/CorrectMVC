//
//  Post+Stub.swift
//  CorrectMVCTests
//
//  Created by Miras Karazhigitov on 09.03.2022.
//

import CorrectMVC
import Foundation

extension Post {
    static let stub1 = Post(
        id: "1",
        title: "Hello",
        type: .image(URL(string: "https://i.redd.it/y5q2ylf36gm61.jpg")!)
    )

    static let stub2 = Post(
        id: "2",
        title: "Is",
        type: .image(URL(string: "https://i.redd.it/y5q2ylf36gm61.jpg")!)
    )
}

extension Array where Element == Post {
    static let stub1: [Post] = {
        let url = URL(string: "https://i.redd.it/y5q2ylf36gm61.jpg")!
        return [
            Post(id: "1", title: "Hello", type: .image(url)),
            Post(id: "2", title: "This", type: .image(url)),
            Post(id: "3", title: "Is", type: .image(url)),
            Post(id: "4", title: "Demo", type: .image(url)),
            Post(id: "5", title: "Project", type: .image(url)),
            Post(id: "6", title: "For", type: .image(url)),
            Post(id: "7", title: "MVC", type: .image(url)),
        ]
    }()
}
