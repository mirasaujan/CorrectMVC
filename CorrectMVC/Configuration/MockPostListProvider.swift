//
//  MockPostListProvider.swift
//  CorrectMVC
//
//  Created by Miras Karazhigitov on 06.03.2022.
//

import UIKit

class MockPostListProvider: PostListProvider {
    func fetch() async throws -> [Post] {
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
    }

    private func createLocalUrl(forImageNamed name: String, imageExtension: String = "png") -> URL? {
        let fileManager = FileManager.default

        guard let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            print("Unable to access cache directory")
            return nil
        }

        let url = cacheDirectory.appendingPathComponent("\(name).\(imageExtension)")

        guard fileManager.fileExists(atPath: url.path) else {
            guard let image = UIImage(named: name, in: Bundle(for: Self.self), with: nil),
                  let data = image.jpegData(compressionQuality: 1) else {
                print("Impossible to convert to jpg data")
                return nil
            }

            fileManager.createFile(atPath: url.path, contents: data, attributes: nil)
            return url
        }

        return url
    }
}
