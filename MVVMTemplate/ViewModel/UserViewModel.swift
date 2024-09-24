//
//  UserViewModel.swift
//  MVVMTemplate
//
//  Created by Rafael Santos on 24/09/2024.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    
    // Public properties that can be observed
    @Published var users: [User] = []
    
    // Private properties
    private var cancellables = Set<AnyCancellable>()
    private let userServices: UserServiceProtocol
    
    init(userServices: UserServiceProtocol = UserService()) {
        self.userServices = userServices
        fetchUsers()
    }
    
    func fetchUsers() {
        userServices.fetchUsers()
            .sink { completion in
                // Handle error or completion
                print("Rafael -> Handle completion: \(completion)")
            } receiveValue: { [weak self] result in
                self?.users = result
            }
            .store(in: &cancellables)

    }
}
