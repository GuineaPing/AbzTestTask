//
//  StatusType.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 09.01.2025.
//

// Status pages types

enum StatusType: Int {
    case undefined = 0
    case connection = 1
    case userRegistred = 2
    case emailTaken = 3
    case validation = 4
    
    public var image: String {
        switch self {
        case .undefined: return "logo"
        case .connection: return "offline"
        case .userRegistred: return "registred"
        case .emailTaken: return "taken"
        case .validation: return ""
        }
    }
    
    public var title: String {
        switch self {
        case .undefined: return "Continue..."
        case .connection: return "There is no internet connection"
        case .userRegistred: return "User successfully registered"
        case .emailTaken: return "That email is already registered"
        case .validation: return "Validation failed"
        }
    }
    
    public var actionTitle: String {
        switch self {
        case .undefined: return "Back"
        case .connection: return "Try again"
        case .userRegistred: return "Got it"
        case .emailTaken: return "Try again"
        case .validation: return "Edit"
        }
    }
}
