//
//  Untitled.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 08.01.2025.
//

import SwiftUI

// launch screen
struct SplashView: View {
    var body: some View {
        ZStack {
            Color(.appPrimary)
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .padding(100)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SplashView()
}
