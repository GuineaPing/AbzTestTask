//
//  TabBarButton.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 10.01.2025.
//

import SwiftUI

struct TabBarButton: View {
    var icon: String
    var label: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Image(systemName: icon)
            Text(label)
        }
        .font(.heading1)
        .foregroundColor(isSelected ? .appSecondary : .appPrimaryTextBar)
    }
}

#Preview {
    HStack {
        Spacer()
        TabBarButton(icon: "person.3.sequence.fill", label: "Users", isSelected: true, action: {})
        Spacer()
        TabBarButton(icon: "person.crop.circle.fill.badge.plus", label: "Signup", isSelected: false, action: {})
        Spacer()
    }

}
