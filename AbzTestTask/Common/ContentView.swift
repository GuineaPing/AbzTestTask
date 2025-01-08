//
//  ContentView.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 08.01.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("abz.test.task")
                .font(.heading1)
            Divider()
            Text("Main View")
                .font(.body1)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
