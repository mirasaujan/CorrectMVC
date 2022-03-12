//
//  Deeplink.swift
//  CorrectMVC
//
//  Created by Miras Karazhigitov on 12.03.2022.
//

import Foundation

typealias DeeplinkType = String

protocol Deeplink {
    var type: DeeplinkType { get }

    func proccess()
}
