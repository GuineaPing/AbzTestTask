//
//  ContentView.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 08.01.2025.
//

import SwiftUI

// main application View

struct ContentView: View {
    @State private var tabSection = 0
    @State private var errorMessage = false
    @State private var status: StatusType = .undefined
    
    var body: some View {
        if tabSection == 0 {
            // users list
            UsersView(showError: $errorMessage)
            // network an operation fullscreen messages
                .fullScreenCover(isPresented: $errorMessage) {
                    StatusView(show: $errorMessage, status: .connection)
                }
        } else {
            // signup form
            SignupView(showError: $errorMessage, status: $status)
            // network an operation fullscreen messages
                .fullScreenCover(isPresented: $errorMessage) {
                    StatusView(show: $errorMessage, status: status)
                }
        }
        TabBar(selectedTab: $tabSection)
    }
}

#Preview {
    ContentView()
}
