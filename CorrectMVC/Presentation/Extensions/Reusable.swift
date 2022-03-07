//
//  Reusable.swift
//  CorrectMVC
//
//  Created by Miras Karazhigitov on 06.03.2022.
//

import UIKit

public protocol ReuseIdentifiable: AnyObject {
    static var reuseIdentifier: String { get }
    static func nib() -> UINib?
}

public extension ReuseIdentifiable {
    static var reuseIdentifier: String {
        String(describing: self)
    }

    static func nib() -> UINib? {
        guard Bundle(for: self).path(forResource: String(describing: self), ofType: "nib") != nil else {
            return  nil
        }

        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

extension UITableViewCell: ReuseIdentifiable {}
extension UITableViewHeaderFooterView: ReuseIdentifiable {}
extension UICollectionReusableView: ReuseIdentifiable {}
