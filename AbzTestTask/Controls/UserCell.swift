//
//  UserCell.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 10.01.2025.
//

import SwiftUI

struct UserCell: View {
    @State var user: UserModel
    
    var body: some View {
        HStack {
            VStack {
                AsyncImage(url: URL(string:user.photo)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaledToFit()
                            .cornerRadius(25)
                            .frame(width: 50, height: 50)
                    case .failure:
                        Image(systemName: "exclamationmark.icloud")
                            .foregroundColor(.gray)
                    @unknown default:
                        EmptyView()
                    }
                }
                Spacer()
            }
            .padding(.trailing, 10)
            VStack(alignment: .leading, spacing: 5) {
                Text(user.name)
                    .font(.body2)
                    .lineLimit(3)
                Text(user.position)
                    .foregroundStyle(.appPrimaryTextBar)
                    .padding(.bottom, 5)
                Text(user.email)
                Text(user.phone)
                Divider().padding(.top, 10)
            }
            .lineLimit(1)
            .truncationMode(.tail)
            .font(.body3)
            .foregroundStyle(.appPrimaryText)
            Spacer()
        }
        .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
    }
}
