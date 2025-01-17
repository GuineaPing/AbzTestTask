//
//  PositionSelector.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 11.01.2025.
//

import SwiftUI

// user position select control
// made scrolled to avoid scrolling signup view
// to make bottom signup button always visible

struct PositionSelector: View {
    @Binding var selectedPosition: Int
    @Binding var showError: Bool
    @StateObject private var positionsData = PositionsViewModel()

    var body: some View {
        ZStack {
            fetchWait
            VStack {
                header
                positions
                Spacer()
            }.onAppear {
                positionsData.fetchPositionsData()
            }
            .onChange(of: $showError.wrappedValue) {
                if !$showError.wrappedValue {
                    positionsData.fetchPositionsData()
                }
            }
        }
    }
    
    var fetchWait: some View {
        VStack {
            if positionsData.isLoading {
                ProgressView().scaleEffect(3)
            } else {
                EmptyView()
            }
        }
    }
                
    var header: some View {
        VStack(spacing: 12) {
            HStack {
                Text("Select your position")
                    .font(.body2)
                    .foregroundStyle(.appPrimaryText)
                Spacer()
            }
        }
    }
    
    var positions: some View {
        VStack {
            if positionsData.isLoading && positionsData.positions.isEmpty {
                Text("loading...")
                    .font(.body2)
                    .foregroundStyle(.appGray)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            } else
            if positionsData.error != nil {
                Text("no positions")
                .onAppear {
                    showError = true
//                    print(">> positions: \(error)")
                }
            } else {
                posiotionsList
            }
        }
    }
    
    var posiotionsList: some View {
        ScrollView {
            VStack {
                ForEach(positionsData.positions , id: \.id) { position in
                    PositionCell(selectedPositionId: selectedPosition, position: position)
                        .onTapGesture {
                            selectedPosition = position.id
                        }
                        .frame(height: 40)
                        .padding(EdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 14))
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var error: Bool = false
    @Previewable @State var selectedPosition: Int = 1
    PositionSelector(selectedPosition: $selectedPosition, showError: Binding.constant(false))
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 10, trailing: 20))
}
