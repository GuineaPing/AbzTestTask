//
//  ContentView.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 08.01.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var tokenViewModel = TokenViewModel()
    @StateObject private var usersViewModel = UsersViewModel()
    
    var body: some View {
        VStack {
            
            Text("abz.test.task")
                .font(.heading1)
            Divider()
            token
            Divider()
            users
            
        }
        .padding()
        .onAppear {
            tokenViewModel.fetchTokenData()
            usersViewModel.fetchUserData()
        }
    }
    
    var token: some View {
        VStack {
            if tokenViewModel.isLoading {
                ProgressView()
            } else if let error = tokenViewModel.error {
                Text(error)
                    .foregroundStyle(.appRed)
                    .font(.headline)
            } else {
                Text("status: online")
                    .font(.body2)
            }
        }
    }
    
    var users: some View {
        VStack {
            if usersViewModel.isLoading {
                ProgressView()
            } else if let error = usersViewModel.error {
                Text(error)
                    .foregroundStyle(.appRed)
                    .font(.headline)
            } else {
                Text("users: \(usersViewModel.users.count)")
                    .font(.body2)
            }
        }
    }
    
}

#Preview {
    ContentView()
}
