//
//  EndpointType.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 09.01.2025.
//

enum EndpointType: Int {
    case error = 0
    case token = 1
    case users = 2
    case positions = 3
    
    public var endpoint: String {
        switch self {
        case .error: return "error"
        case .token: return "token"
        case .users: return "users"
        case .positions: return "positions"
        }
    }
}
