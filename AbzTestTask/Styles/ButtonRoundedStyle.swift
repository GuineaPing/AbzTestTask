//
//  Untitled.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 09.01.2025.
//

import SwiftUI

struct ButtonRoundedStyle: ButtonStyle {
    @State var disabled: Bool = false
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.body1)
            .foregroundStyle(disabled ? .appPrimaryTextDisabled : .appPrimaryText)
            .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
            .background(
                disabled ? Color.appButtonDisabled :
                    configuration.isPressed ? Color.appButtonPressed : Color.appPrimary)
            .cornerRadius(24)
    }
}
