//
//  EditText.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 10.01.2025.
//

import SwiftUI

struct EditText: View {
    @Binding var text: String
    @State var placeholder: String = "Enter text"
    @State var comment = ""
    @State var warning = ""
    @State var isWarning = false
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            VStack {
                TextField(placeholder, text: $text)
                    .font(.heading1)
                    .foregroundColor(.appPrimaryTextDisabled)
                    .padding()
            }
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(.appGrayLight, lineWidth: 1)
            )
            VStack(alignment: .leading) {
                if isWarning {
                    Text("warning")
                        .foregroundStyle(.appRed)
                } else {
                    Text(comment)
                        .foregroundStyle(.appPrimaryTextBar)
                }
            }
            .padding(.leading, 16)
            .font(.body1)
        }

    }
}


#Preview {
    @Previewable @State var text = "Text"
    @Previewable @State var emptyText = ""
    EditText (
        text: $emptyText,
        placeholder: "Your name",
        comment: "",
        warning: "",
        isWarning: false
    ).padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
    EditText (
        text: $emptyText,
        placeholder: "Phone",
        comment: "+38 (XXX) XXX - XX - XX",
        warning: "",
        isWarning: false
    ).padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
}
