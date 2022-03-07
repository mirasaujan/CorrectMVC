//
//  RedditSort.swift
//  CorrectMVC
//
//  Created by Miras Karazhigitov on 07.03.2022.
//

import Foundation

struct RedditSort: Codable, Equatable {
    let type: SortType
    let period: SortPeriod?

    enum SortType: String, Codable, CaseIterable, Equatable {
        case hot, top, new, controversial, rising

        var hasPeriod: Bool {
            self == .top || self == .controversial
        }

        var label: String {
            rawValue.capitalized
        }

        var imageName: String {
            switch self {
            case .hot:
                return "flame"
            case .new:
                return "clock"
            case .controversial:
                return "bolt"
            case .top:
                return "arrowtriangle.up.circle"
            case .rising:
                return "arrow.up.right"
            }
        }

    }

    enum SortPeriod: String, CaseIterable, Codable {
        case hour, day, week, month, year, all

        var label: String {
            switch self {
            case .hour:
                return "Now"
            case .day:
                return "Today"
            case .week:
                return "This week"
            case .month:
                return "This month"
            case .year:
                return "This year"
            case .all:
                return "All time"
            }
        }

    }
}

