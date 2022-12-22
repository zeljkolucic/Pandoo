//
//  Validator.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 22.12.22..
//

import Foundation

public final class Validator {
    private struct ValidationError: LocalizedError {
        let message: String
        var errorDescription: String? { return message.localized }
        
        init(with message: String) {
            self.message = message
        }
    }
    
    private let validate: (String?) throws -> Void
    
    public init(_ validate: @escaping (String?) throws -> Void) {
        self.validate = validate
    }
    
    public static func validate(_ value: String?, against validator: Validator) throws {
        try validator.validate(value)
    }
    
    public static func validate(_ condition: @autoclosure () -> Bool, errorMessage: @autoclosure () -> String) throws {
        guard condition() else {
            let message = errorMessage()
            throw ValidationError(with: message)
        }
    }
}
