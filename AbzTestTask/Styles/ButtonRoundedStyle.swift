//
//  Untitled.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 09.01.2025.
//

import SwiftUI

struct ButtonRoundedStyle: ButtonStyle {
    @Binding var disabled: Bool
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.body1)
            .foregroundStyle(disabled ? .appPrimaryTextDisabled : .appPrimaryText)
            .padding(EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24))
            .background(
                disabled ? Color.appButtonDisabled :
                    configuration.isPressed ? Color.appButtonPressed : Color.appPrimary)
            .cornerRadius(24)
    }
}
