//
//  NSObject+className.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 28.12.22..
//

import Foundation

public extension NSObject {
    static var className: String {
        return String(describing: self.self)
    }
}
