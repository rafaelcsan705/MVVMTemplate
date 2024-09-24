//
//  UserService.swift
//  MVVMTemplate
//
//  Created by Rafael Santos on 24/09/2024.
//

import Foundation
import Combine

protocol UserServiceProtocol {
    func fetchUsers() -> AnyPublisher<[User], Never>
}

class UserService: UserServiceProtocol {
    func fetchUsers() -> AnyPublisher<[User], Never> {
        let users: [User] = [
            User(name: "John Doe", email: "john@example.com"),
            User(name: "Jane Doe", email: "jane@example.com")
        ]
        
        return Just(users)
            .eraseToAnyPublisher()
    }
}
