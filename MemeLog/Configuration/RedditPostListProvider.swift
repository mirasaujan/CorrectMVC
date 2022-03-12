//
//  RedditPostListProvider.swift
//  MemeLog
//
//  Created by Miras Karazhigitov on 07.03.2022.
//

import Foundation
import Combine

class RedditPostListProvider: PostListProvider {
    private let apiClient: RedditAPIProtocol
    private var bag = Set<AnyCancellable>()

    init(apiClient: RedditAPIProtocol) {
        self.apiClient = apiClient
    }

    func fetch() async throws -> [Post] {
        return try await withCheckedThrowingContinuation { continuation in
            apiClient.memesFeed()
                .sink { error in
                    print(error)
                } receiveValue: { listing in
                    continuation.resume(returning: listing.posts.compactMap {
                        if $0.isImage, let imageURL = URL(string: $0.fullImageUrl ?? "") {
                            return Post(id: $0.id, title: $0.title, type: .image(imageURL))
                        }

                        return nil
                    })
                }
                .store(in: &bag)
        }
    }
}
