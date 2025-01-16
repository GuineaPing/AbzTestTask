//
//  Button.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 08.01.2025.
//

import SwiftUI

struct ButtonRound: View {
    @State var title: String = ""
    @Binding var tap: Bool
    @Binding var disabled: Bool
    
    var body: some View {
        Button {
            tap.toggle()
        } label: {
            Text(title)
        }
        .buttonStyle(ButtonRoundedStyle(disabled: $disabled))
        .disabled(disabled)
    }
}

#Preview {
    @Previewable @State var tap: Bool = false
    @Previewable @State var disabled: Bool = true
    ButtonRound(
        title: "Normal",
        tap: $tap,
        disabled: $disabled).onChange(of: tap, {
        print(">> fiered")
    })
}
