//
//  StatusType.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 09.01.2025.
//

enum StatusType: Int {
    case nominal = 0
    case connection = 1
    case userRegistred = 2
    case emailTaken = 3
    
    public var image: String {
        switch self {
        case .nominal: return "logo"
        case .connection: return "offline"
        case .userRegistred: return "registred"
        case .emailTaken: return "taken"
        }
    }
    
    public var title: String {
        switch self {
        case .nominal: return "Continue..."
        case .connection: return "There is no internet connection"
        case .userRegistred: return "User successfully registered"
        case .emailTaken: return "That email is already registered"
        }
    }
    
    public var actionTitle: String {
        switch self {
        case .nominal: return "Back"
        case .connection: return "Try again"
        case .userRegistred: return "Got it"
        case .emailTaken: return "Try again"
        }
    }
}
