//
//  Button.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 08.01.2025.
//

import SwiftUI

struct ButtonRound: View {
    
    @Binding var tap: Bool
    @State var title: String = ""
    @State var disabled: Bool = false
    
    var body: some View {
        Button {
            tap.toggle()
        } label: {
            Text(title)
        }
        .buttonStyle(ButtonRoundedStyle(disabled: disabled))
        .disabled(disabled)
    }
}

#Preview {
    @Previewable @State var tap: Bool = false
    ButtonRound(tap: $tap,
                title: "Normal",
                disabled: true).onChange(of: tap, {
        print(">> fiered")
    })
}
