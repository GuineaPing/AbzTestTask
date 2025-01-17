//
//  SplashView.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 08.01.2025.
//

import SwiftUI

struct StartView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    // launch screen & main view run
    var body: some View {
        if isActive {
            ContentView()
        } else {
            SplashView()
                .onAppear {
                    withAnimation(.easeOut(duration: 0.5)) {
                        self.size = 1.0
                        self.opacity = 1.0
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
        }
    }
}

#Preview {
    StartView()
}
