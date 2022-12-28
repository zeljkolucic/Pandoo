//
//  RegistrationViewModel.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 22.12.22..
//

import Foundation

public final class RegistrationViewModel {
    var firstName: String?
    var lastName: String?
    var phone: String?
    var address: String?
    var email: String?
    var password: String?
    
    func validate(firstName: String?) throws {
        try Validator.validate(firstName, against: .firstName)
    }
    
    func validate(lastName: String?) throws {
        try Validator.validate(lastName, against: .lastName)
    }
    
    func validate(phone: String?) throws {
        try Validator.validate(phone, against: .phone)
    }
    
    func validate(address: String?) throws {
        try Validator.validate(address, against: .address)
    }
    
    func validate(email: String?) throws {
        try Validator.validate(email, against: .email)
    }
    
    func validate(password: String?) throws {
        try Validator.validate(password, against: .password)
    }
}
