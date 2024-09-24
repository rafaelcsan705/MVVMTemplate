//
//  MVVMTemplateApp.swift
//  MVVMTemplate
//
//  Created by Rafael Santos on 24/09/2024.
//

import SwiftUI

@main
struct MVVMTemplateApp: App {
    var body: some Scene {
        WindowGroup {
            UserListView(viewModel: UserViewModel())
        }
    }
}
