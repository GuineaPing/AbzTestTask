//
//  EditText.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 10.01.2025.
//

import SwiftUI

// edit text control for Signup View

struct EditText: View {
    // text for edit
    @Binding var text: String
    // control placeholder field up - gray, not valid - red
    @State var placeholder: String = "Enter text"
    // gray comments text under control
    @State var comment: String?
    // red vong validation text under control
    @State var warning: String?
    // warning title up to edit text
    @State var warningTitle: String?
    // keyboard type for text edit
    @State var keyboardType: UIKeyboardType = .default
    // valid / invalit flag
    @Binding var isWarning: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            VStack(alignment: .leading, spacing: 0) {
                if (isWarningTitle) {
                    Text(warningTitle ?? "")
                        .font(.body1)
                        .foregroundStyle(.appRed)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
                }
                TextField("",
                          text: $text,
                          prompt: Text(placeholder)
                                .foregroundStyle(isWarning ? .appRed : .appPrimaryTextDisabled)
                    )
                    .font(.heading1)
                    .foregroundColor(.appPrimaryText)
                    .keyboardType(keyboardType)
                    .padding(EdgeInsets(top: isWarningTitle ? 0 : 20, leading: 20, bottom: isWarningTitle ? 10 : 20, trailing: 20))
            }
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(isWarning ? .appRed : .appGrayLight, lineWidth: 1)
            )
            VStack(alignment: .leading) {
                if isWarning {
                    Text(warning ?? "")
                        .font(.body1)
                        .foregroundStyle(.appRed)
                } else {
                    Text(comment ?? "")
                        .font(.body1)
                        .foregroundStyle(.appPrimaryTextBar)
                }
            }
            .frame(height: 20)
            .padding(.leading, 16)
        }
    }
    
    var isWarningTitle: Bool {
        isWarning && warningTitle != nil && !text.isEmpty
    }
}


#Preview {
    @Previewable @State var text = "Text"
    @Previewable @State var emptyText = ""
    @Previewable @State var email = "username.gmail.com"
    EditText (
        text: $emptyText,
        placeholder: "Your name",
        comment: "",
        warning: "",
        isWarning: Binding.constant(false)
    ).padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
    EditText (
        text: $email,
        placeholder: "Email",
        comment: "",
        warning: "Required field",
        warningTitle: "Email",
        isWarning: Binding.constant(true)
    ).padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
    EditText (
        text: $emptyText,
        placeholder: "Phone",
        comment: "+38 (XXX) XXX - XX - XX",
        warning: "",
        isWarning: Binding.constant(false)
    ).padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
    EditText (
        text: $emptyText,
        placeholder: "Phone",
        comment: "+38 (XXX) XXX - XX - XX",
        warning: "Required field",
        isWarning: Binding.constant(true)
    ).padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
}
