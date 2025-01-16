//
//  Users.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 08.01.2025.
//

import SwiftUI

struct UsersView: View {
    @Binding var showError: Bool
    @State private var refresh = false
    @StateObject private var usersData = UsersViewModel()
    
    var body: some View {
        VStack {
            PageHeader(title: "Working with GET request", tapped: $refresh).onChange(of: refresh) {
                // clear users list om header tap
                // refresh api request on pull users list down
                if usersData.users.isEmpty {
                    usersData.fetchUserData()
                } else {
                    usersData.users = []
                }
            }
            ZStack {
                fetchWait
                users
            }
        }.onAppear {
            usersData.fetchUserData()
        }.onChange(of: $showError.wrappedValue) {
            if !$showError.wrappedValue {
                usersData.fetchUserData()
            }
        }
    }
    
    var fetchWait: some View {
        VStack {
            if usersData.isLoading {
                ProgressView().scaleEffect(3)
            } else {
                EmptyView()
            }
        }
    }
    
    var users: some View {
        VStack {
            if usersData.isLoading && usersData.users.isEmpty {
                Text("users: loading...")
                    .font(.body2)
                Spacer()
            } else
            if let error = usersData.error {
                noUsers
                .onAppear {
                    showError = true
                    print(">> users: \(error)")
                }
            } else {
                if usersData.users.isEmpty {
                    noUsers
                } else {
                    usersList
                }
            }
        }
    }
    
    var noUsers: some View {
        VStack {
            Spacer()
            Image("users")
                .resizable()
                .scaledToFit()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding(.bottom, 25)
            Text("There are no users yet").font(.heading1)
            Spacer()
        }
    }
    
    var usersList: some View {
        ScrollView {
            ForEach(usersData.users, id: \.self) { user in
                UserCell(user: user)
            }
            Spacer()
        }
        .refreshable {
            usersData.fetchUserData()
        }
        .padding(.top, 20)
    }
}

#Preview {
    @Previewable @State var error: Bool = false
    UsersView(showError: $error)
}
