//
//  LoginViewModel.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 22.12.22..
//

import Foundation

public final class LoginViewModel {
    struct InvalidCredentialsError: Error {}
    
    func logInWith(email: String, password: String, completion: @escaping (Result<(), Error>) -> Void) {
        guard let user = User.users.filter({ $0.email == email && $0.password == password }).first else {
            return completion(.failure(InvalidCredentialsError()))
        }
        
        User.loggedInUser = user
        completion(.success(()))
    }
}
