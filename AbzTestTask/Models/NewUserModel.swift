//
//  UserModel.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 08.01.2025.
//

import Foundation

struct NewUserModel: Codable, Hashable {
    
    var name: String?
    var email: String?
    var phone: String?
    var position: String?
    var positionID, registrationTimestamp: Int?
    var photo: String?

    enum CodingKeys: String, CodingKey {
        case name
        case email
        case phone
        case position
        case positionID = "position_id"
        case registrationTimestamp = "registration_timestamp"
        case photo
    }
    
    internal init() {
        self.name = ""
        self.email = ""
        self.phone = ""
        self.position = ""
        self.positionID = 1
        self.registrationTimestamp = 0
        self.photo = ""
    }
}
