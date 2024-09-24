//
//  UserListView.swift
//  MVVMTemplate
//
//  Created by Rafael Santos on 24/09/2024.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: UserViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.users) { user in
                    Text(user.name)
                }
            }
            .navigationTitle("Users")
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(viewModel: UserViewModel())
    }
}
