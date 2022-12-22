//
//  UIViewController+className.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 22.12.22..
//

import UIKit

public extension UIViewController {
    static var className: String {
        return String(describing: self.self)
    }
}
