//
//  UIView+TypeName.swift
//  Sufler
//
//  Created by Miras Karazhigitov on 30.03.2021.
//

import UIKit

extension UIView {
    static func viewFromNib(from bundle: Bundle? = nil) -> Self? {
        let nib = UINib(nibName: Self.typeName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? Self
    }
}
