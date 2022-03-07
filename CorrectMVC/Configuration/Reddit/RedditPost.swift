//
//  RedditPost.swift
//  CorrectMVC
//
//  Created by Miras Karazhigitov on 07.03.2022.
//

import Foundation

struct RedditPost: Decodable, Identifiable {
    let title: String
    let name: String
    let id: String
    let selftext: String
    let selftext_html: String?
    let url: String
    let author: String
    let score: Int
    let stickied: Bool
    let over_18: Bool
    let preview: Preview?
    let secure_media: Media?

    struct Preview: Decodable {
        let images: [PreviewImage]
        let enabled: Bool

        struct PreviewImage: Decodable {
            let source: ImageSource
            let resolutions: [ImageSource]
            let id: String

            struct ImageSource: Decodable {
                let url: String
                let width: Int
                let height: Int
            }
        }
    }

    struct Media: Decodable {
        struct RedditVideo: Decodable {
            let fallback_url: String
            let duration: Int
            let hls_url: String
            let is_gif: Bool
        }

        let reddit_video: RedditVideo?
    }
}

extension RedditPost: Equatable {
    static func == (lhs: RedditPost, rhs: RedditPost) -> Bool {
        lhs.name == rhs.name
    }
}

extension RedditPost: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

extension RedditPost {
    var isImage: Bool {
        fullImageUrl != nil
    }

    var fullImageUrl: String? {
        url.hasSuffix(".jpg") || url.hasSuffix(".png") ? url : nil
    }
}
