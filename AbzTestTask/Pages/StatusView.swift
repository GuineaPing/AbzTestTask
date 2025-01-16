//
//  MessageView.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 08.01.2025.
//

import SwiftUI

struct StatusView: View {
    @Binding var show: Bool
    @State var status: StatusType = .connection
    @State private var tapped: Bool = false

    var body: some View {
        VStack {
            Spacer()
            Image(status.image)
                .resizable()
                .scaledToFit()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding(.bottom, 25)
            Text(status.title).font(.heading1)
                .padding(.bottom, 25)
            ButtonRound(
                title: status.actionTitle,
                tap: $tapped,
                disabled: Binding.constant(false))
                    .onChange(of: tapped) { show = false }
            Spacer()
        }
        
    }
}

#Preview {
    @Previewable @State var tap: Bool = false
    StatusView(
        show: $tap,
        status: .connection
    )
}
