//
//  Array+Extensions.swift
//  ReactApp
//
//  Created by Тимур Табынбаев on 13.12.2021.
//

import Foundation

extension Array {
    func removedDuplicates<S: Sequence>(of otherElements: S) -> Self where S.Element == Self.Element, Self.Element: Hashable {
        let set = Set(otherElements)
        return filter {
            !set.contains($0)
        }
    }
    
    subscript(safely index: Int) -> Self.Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }

        return self[index]
    }
}
