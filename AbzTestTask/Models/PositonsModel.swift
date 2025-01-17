//
//  PositonSelector.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 11.01.2025.
//

import Foundation

// user position data

// MARK: - PositionsModel
struct PositionsModel: Codable {
    let success: Bool
    let positions: [PositionModel]
}

// MARK: - Position
struct PositionModel: Codable, Hashable {
    let id: Int
    let name: String
}
