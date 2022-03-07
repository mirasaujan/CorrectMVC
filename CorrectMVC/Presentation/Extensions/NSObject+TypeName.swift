//
//  NSObject+TypeName.swift
//  Sufler
//
//  Created by Miras Karazhigitov on 30.04.2021.
//

import Foundation

extension NSObject {
    static var typeName: String {
        String(describing: self)
    }
}
