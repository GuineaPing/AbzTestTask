//
//  ContentView.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 08.01.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSection = 0
    @State private var errorConnection = false
    
    var body: some View {
        if tabSection == 0 {
            UsersView(showError: $errorConnection)
                .fullScreenCover(isPresented: $errorConnection) {
                    StatusView(show: $errorConnection, status: .connection)
            }
        } else {
            SignupView()
        }
        TabBar(selectedTab: $tabSection)
    }
    
}

#Preview {
    ContentView()
}
