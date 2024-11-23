//
//  NavigationBar.swift
//  DM126_Aula3
//
//  Created by user270232 on 11/9/24.
//

import SwiftUI

/*struct NavigationBar: View {
    var body: some View {
        HStack{
            Button("Flavio Bergamini") {
                
            }
            .font(.headline)
            .fontWeight(.bold)
            Button(action:{}) {
                Image(systemName: "plus.square.fill")
            }.font(.title2).foregroundStyle(.gray)
        }
    }
} */

struct NavigationBar: View {
    @State private var selectedUser: String = "Flavio Bergamini"
    @State private var isShowingAddUserModal = false
    @State private var users: [String] = ["Flavio Bergamini", "Jose Andery", "Renzo Mesquita"]

    var body: some View {
        HStack {
            Menu {
                ForEach(users, id: \.self) { user in
                    Button(action: {
                        selectedUser = user
                    }) {
                        Text(user)
                    }
                }
            } label: {
                Text(selectedUser)
                    .font(.headline)
                    .fontWeight(.bold)
            }

            Button(action: {
                isShowingAddUserModal = true
            }) {
                Image(systemName: "plus.square.fill")
            }
            .font(.title2)
            .foregroundStyle(.gray)
            .sheet(isPresented: $isShowingAddUserModal) {
                AddUserView(usuarios: $users)
            }
        }
    }
}

#Preview {
    NavigationBar()
}
