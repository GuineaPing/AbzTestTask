//
//  ContentView.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 08.01.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSection = 0
    @State private var errorMessage = false
    @State private var status: StatusType = .undefined
    
    var body: some View {
        if tabSection == 0 {
            UsersView(showError: $errorMessage)
                .fullScreenCover(isPresented: $errorMessage) {
                    StatusView(show: $errorMessage, status: .connection)
                }
        } else {
            SignupView(showError: $errorMessage, status: $status)
                .onChange(of: status) {
                    print(">> Status: \(status)")
                }
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
