//
//  User.swift
//  MVVMTemplate
//
//  Created by Rafael Santos on 24/09/2024.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    var name: String
    var email: String
}
