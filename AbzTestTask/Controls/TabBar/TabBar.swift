//
//  TabBar.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 10.01.2025.
//

import SwiftUI

struct TabBar: View {
    @Binding var selectedTab: Int
    var body: some View {
        VStack {
            HStack {
                Spacer()
                TabBarButton(
                    icon: "person.3.sequence.fill",
                    label: "Users",
                    isSelected: selectedTab == 0,
                    action: {
                        selectedTab = 0
                    }
                )
                Spacer()
                TabBarButton(
                    icon: "person.crop.circle.fill.badge.plus",
                    label: "Signup",
                    isSelected: selectedTab == 1,
                    action: {
                        selectedTab = 1
                    }
                )
                Spacer()
            }
            .frame(height: 56)
            .background(.appGrayBar)
            Spacer().frame(height: 0.25)
        }
    }
}

#Preview {
    @Previewable @State var selectedTab: Int = 0
    TabBar(selectedTab: $selectedTab)
}
