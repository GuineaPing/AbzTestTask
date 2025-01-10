//
//  Signup.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 08.01.2025.
//

import SwiftUI

struct SignupView: View {
    @State private var refresh = false
    var body: some View {
        VStack {
            PageHeader(title: "Working with POST request", tapped: $refresh)
            Spacer()
            Text("Signup")
            Spacer()
        }
    }
}

#Preview {
    SignupView()
}
