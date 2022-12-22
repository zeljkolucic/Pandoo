//
//  RegistrationViewModel.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 22.12.22..
//

import Foundation

public final class RegistrationViewModel {
    
}

// MARK: - Validator

extension Validator {
    private static var emailPattern: String {
        return "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$"
    }
    
    private static var passwordPattern: String {
        return "^(?=.*[A-Z])(?=.*[0-9])(?=.*[ !\\\"#\\$%&'\\(\\)\\*\\+,-\\.\\/:;<=>\\?@\\[\\]\\^_`\\{|\\}~])(?=.{8,}).*"
    }
    
    static var firstName: Validator {
        return Validator { value in
            try validate(value != nil && value?.isEmpty == false, errorMessage: Strings.emptyFirstName.localized)
        }
    }
    
    static var lastName: Validator {
        return Validator { value in
            try validate(value != nil && value?.isEmpty == false, errorMessage: Strings.emptyLastName.localized)
        }
    }
    
    static var phone: Validator {
        return Validator { value in
            try validate(value != nil && value?.isEmpty == false, errorMessage: Strings.emptyPhone.localized)
        }
    }
    
    static var address: Validator {
        return Validator { value in
            try validate(value != nil && value?.isEmpty == false, errorMessage: Strings.emptyAddress.localized)
        }
    }
    
    static var email: Validator {
        return Validator { value in
            try validate(value != nil && value?.isEmpty == false, errorMessage: Strings.emptyEmail.localized)
            try validate(value?.matches(pattern: emailPattern) == true, errorMessage: Strings.invalidEmail.localized)
        }
    }
    
    static var password: Validator {
        return Validator { value in
            try validate(value != nil && value?.isEmpty == false, errorMessage: Strings.emptyPassword.localized)
            try validate(value?.matches(pattern: passwordPattern) == true, errorMessage: Strings.weakPassword.localized)
        }
    }
}
