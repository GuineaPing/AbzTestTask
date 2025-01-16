//
//  ErrorTypes.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 13.01.2025.
//

enum APIError: Error {
    case unprocessableEntity([String])
}

struct ErrorResponse: Codable {
    let errors: [String: [String]]
}

struct UsersError: Codable {
    let success: Bool
    let message: String
}

// MARK: - UsersError422
struct UsersError422: Codable {
    let success: Bool
    let message: String
    let fails: [String: [String]]?
    
    /*
     i.e
     {
         "success": false,
         "message": "Validation failed",
         "fails": {
             "phone": [
                 "The phone format is invalid."
             ]
         }
     }
     */
    
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


