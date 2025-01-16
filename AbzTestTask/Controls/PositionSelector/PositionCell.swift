//
//  PositionCell.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 11.01.2025.
//

import SwiftUI

struct PositionCell: View {
    var selectedPositionId: Int
    @State var position: PositionModel
    
    var body: some View {
        HStack (spacing: 17) {
            checkmark
            Text("\(position.name)")
                .font(.body1)
                .foregroundStyle(.appPrimaryText)
            Spacer()
        }
    }
    
    var checkmark: some View {
        VStack {
            if selectedPositionId == position.id {
                Image(systemName: "record.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit) // or .fill
                    .foregroundStyle(.appSecondary)
            } else {
                Image(systemName: "circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit) // or .fill
                    .foregroundStyle(.appGrayLight)
            }
        }
        .frame(width: 14, height: 14)
    }
}

#Preview {
    @Previewable @State var selectedPosirionId = 0
    @Previewable @State var position0 = PositionModel(id: 0, name: "Position 0")
    @Previewable @State var position1 = PositionModel(id: 1, name: "Position 1")
    VStack(alignment: .leading, spacing: 15) {
        PositionCell(selectedPositionId: selectedPosirionId, position: position0)
        PositionCell(selectedPositionId: selectedPosirionId, position: position1)
    }
    .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
    .multilineTextAlignment(.leading)
}
