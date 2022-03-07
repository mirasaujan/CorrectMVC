//
//  RedditPostListProvider.swift
//  CorrectMVC
//
//  Created by Miras Karazhigitov on 07.03.2022.
//

import Foundation
import Combine

class RedditPostListProvider: PostListProvider {
    private let apiClient: RedditAPI
    private var bag = Set<AnyCancellable>()

    init(apiClient: RedditAPI) {
        self.apiClient = apiClient
    }

    func fetch() async throws -> [Post] {

        return try await withCheckedThrowingContinuation { continuation in
            apiClient.feedFor(subreddit: "memes", sort: RedditSort(type: .top, period: .all), after: nil)
                .sink { error in
                    print(error)
                } receiveValue: { listing in
                    continuation.resume(returning: listing.posts.compactMap {
                        if $0.isImage, let imageURL = URL(string: $0.fullImageUrl ?? "") {
                            return Post(id: $0.id, title: $0.title, type: .image(imageURL))
                        }

                        return Post(id: $0.id, title: $0.title, type: .text($0.selftext))
                    })
                }
                .store(in: &bag)
        }
    }
}
