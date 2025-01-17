//
//  PgeHeader.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 09.01.2025.
//

import SwiftUI

// Header Title
// tap event can be conumed developer for debug purposes

struct PageHeader: View {
    @State var title: String = "..."
    @Binding var tapped: Bool
    
    var body: some View {
        VStack {
            Spacer().frame(height: 0.25)
            VStack {
                Text(title).font(.heading1)
            }
            .frame(height: 56)
            .frame(maxWidth: .infinity)
            .background(.appPrimary)
        }.onTapGesture {
            tapped.toggle()
        }
    }
}

#Preview {
    @Previewable @State var tap: Bool = false
    PageHeader(title: "Working with GET request", tapped: $tap)
}
