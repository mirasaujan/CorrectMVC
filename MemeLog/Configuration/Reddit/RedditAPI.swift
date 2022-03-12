//
//  RedditAPI.swift
//  MemeLog
//
//  Created by Miras Karazhigitov on 07.03.2022.
//

import Foundation
import Combine

public protocol RedditAPIProtocol {
    func memesFeed() -> AnyPublisher<RedditListing, Error>
}

public class RedditAPI: RedditAPIProtocol {
    typealias APIError = RedditAPIError

    public func memesFeed() -> AnyPublisher<RedditListing, Error> {
        guard var urlComponents = URLComponents(string: "https://www.reddit.com/r/memes/hot.json") else {
            return Fail(error: APIError.invalidUrl).eraseToAnyPublisher()
        }

        urlComponents.queryItems = [URLQueryItem(name: "raw_json", value: "1")]
        urlComponents.queryItems?.append(URLQueryItem(name: "t", value: "All Time"))

        let url = urlComponents.url!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: RedditListing.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
