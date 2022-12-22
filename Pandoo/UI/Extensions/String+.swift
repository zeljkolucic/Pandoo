//
//  String+.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 22.12.22..
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func matches(pattern: String) -> Bool {
        return self.range(of: pattern, options: .regularExpression) != nil
    }
}
