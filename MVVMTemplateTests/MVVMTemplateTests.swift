//
//  MVVMTemplateTests.swift
//  MVVMTemplateTests
//
//  Created by Rafael Santos on 24/09/2024.
//

import XCTest
import Combine
@testable import MVVMTemplate

class MVVMTemplateTests: XCTestCase {

    var viewModel: UserViewModel!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cancellables = []
        viewModel = UserViewModel(userServices: MockUserService())
    }

    override func tearDown() {
        cancellables = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testFetchUsers() {
        let expectation = XCTestExpectation(description: "Fetch Users")
        viewModel.$users
            .sink { users in
                if !users.isEmpty {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        viewModel.fetchUsers()
        wait(for: [expectation], timeout: 1.0)
    }
}

class MockUserService: UserServiceProtocol {
    func fetchUsers() -> AnyPublisher<[User], Never> {
        let users = [
            User(name: "Rafael", email: "rafael@gmail.com"),
            User(name: "Fábio", email: "fabio@gmail.com"),
            User(name: "Sofia", email: "sofia@gmail.com")
        ]
        return Just(users).eraseToAnyPublisher()
    }
}
