//
//  RedditAPI.swift
//  CorrectMVC
//
//  Created by Miras Karazhigitov on 07.03.2022.
//

import Foundation
import Combine

class RedditAPI {
    typealias APIError = RedditAPIError
    let imageSubreddits = ["memes", "dankmemes", "ComedyCemetery", "meme", "terriblefacebookmemes",
                           "BlackPeopleTwitter", "tumblr", "wholesomememes",
                           "PrequelMemes", "puns", "adviceanimals", "meirl"]
    let videoSubreddits = ["funnyvideos", "unexpected", "contagiouslaughter", "therewasanattempt",
                           "holdmybeer", "diwhy", "PlayItAgainSam"]

    func feedFor(subreddit: String, sort: RedditSort, after: String?) -> AnyPublisher<RedditListing, Error> {
        guard var urlComponents = URLComponents(string: "https://www.reddit.com/r/\(subreddit)/\(sort.type.rawValue).json") else {
            return Fail(error: APIError.invalidUrl).eraseToAnyPublisher()
        }

        urlComponents.queryItems = [URLQueryItem(name: "raw_json", value: "1")]
        if let after = after {
            urlComponents.queryItems?.append(URLQueryItem(name: "after", value: after))
        }
        if let sortPeriod = sort.period {
            urlComponents.queryItems?.append(URLQueryItem(name: "t", value: sortPeriod.rawValue))
        }

        let url = urlComponents.url!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: RedditListing.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    func parsePostId(from url: URL) -> String? {
        // example:
        // https://www.reddit.com/r/Unexpected/comments/s4h9m1/dude_raises_his_creepy_game_to_next_level/?utm_source=share&utm_medium=ios_app&utm_name=iossmf
        guard url.absoluteString.contains("reddit.com/r/"),
              let commentsIndex = url.pathComponents.firstIndex(of: "comments"),
              let id = url.pathComponents[safely: commentsIndex + 1] else {
                  return nil
              }

        return "t3_\(id)"
    }

    func postFor(id: String) -> AnyPublisher<RedditPost, Error> {
        guard var urlComponents = URLComponents(string: "https://www.reddit.com/by_id/\(id).json") else {
            return Fail(error: APIError.invalidUrl).eraseToAnyPublisher()
        }

        urlComponents.queryItems = [URLQueryItem(name: "raw_json", value: "1")]

        let url = urlComponents.url!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: RedditListing.self, decoder: JSONDecoder())
            .tryMap {
                if let post = $0.posts.first {
                    return post
                } else {
                    throw APIError.emptyResponse
                }
            }
            .eraseToAnyPublisher()
    }
}
