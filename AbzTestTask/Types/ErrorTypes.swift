//
//  ErrorTypes.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 13.01.2025.
//

// Errors that provides POST user API

enum APIError: Error {
    case unprocessableEntity([String])
}

struct ErrorResponse: Codable {
    let errors: [String: [String]]
}

// general error message
struct UsersError: Codable {
    let success: Bool
    let message: String
}

// MARK: - UsersError422
// validation error message
struct UsersError422: Codable {
    let success: Bool
    let message: String
    let fails: [String: [String]]?
    
    var failsList: [String] {
        var result: [String] = [message]
        if fails != nil {
            for (key, value) in fails! {
                for item in value {
                    result.append("\(key): \(item)")
                }
            }
        }
        return result
    }
}


