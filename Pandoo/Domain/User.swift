//
//  User.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 27.1.23..
//

import Foundation

public class User {
    let email: String
    var firstName: String
    var lastName: String
    var address: String
    var phoneNumber: String
    var password: String
    
    public init(email: String, firstName: String, lastName: String, address: String, phoneNumber: String, password: String) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.phoneNumber = phoneNumber
        self.password = password
    }
    
    static var loggedInUser: User?
    
    static var users = [
        User(
            email: "zeljko.lucic99@gmail.com",
            firstName: "Zeljko",
            lastName: "Lucic",
            address: "Bulevar kralja Aleksandra 77",
            phoneNumber: "+381641234567",
            password: "Testiranje123!"
        )
    ]
}
