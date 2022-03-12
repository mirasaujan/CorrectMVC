//
//  RedditAPIError.swift
//  MemeLog
//
//  Created by Miras Karazhigitov on 07.03.2022.
//

import Foundation

enum RedditAPIError: String, LocalizedError {
    case invalidUrl = "Invalid URL"
    case emptyResponse = "Empty Response"

    var errorDescription: String? {
        rawValue
    }
}
