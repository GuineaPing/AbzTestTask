//
//  UserModel.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 08.01.2025.
//

import Foundation

struct UserModel: Codable, Hashable {
    
    var id: Int
    var name: String
    var email: String
    var phone: String
    var position: String
    var positionID, registrationTimestamp: Int
    var photo: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
        case phone
        case position
        case positionID = "position_id"
        case registrationTimestamp = "registration_timestamp"
        case photo
    }
    
    // MARK: inits
    
    internal init() {
        self.id = 1
        self.name = ""
        self.email = ""
        self.phone = ""
        self.position = ""
        self.positionID = 1
        self.registrationTimestamp = 0
        self.photo = ""
    }

    // test data init
    internal init(id: Int) {
        self.id = id
        self.name = "Ada Lovelace"
        self.email = "ada.lovelace@gmail.com"
        self.phone = "+38 (050) 123 - 45 - 67"
        self.position = ""
        self.positionID = 3
        self.registrationTimestamp = 0
        self.photo = ""
    }
    
    internal init(id: Int, name: String, email: String, phone: String, position: String, positionID: Int, registrationTimestamp: Int, photo: String) {
        self.id = id
        self.name = name
        self.email = email
        self.phone = phone
        self.position = position
        self.positionID = positionID
        self.registrationTimestamp = registrationTimestamp
        self.photo = photo
    }
    
    // MARK: processed fields
    
    var phoneClean: String {
        // Regular expression to match anything that's not a digit or '+'
        let regex = "[^0-9+]"
        let result = phone.replacingOccurrences(of: regex, with: "", options: .regularExpression)
        return result
    }
    
    // MARK: validation
    
    var isNameValid: Bool {
//        return !name.isEmpty
        let fullNameRegex = Constants.nameMask
        let fullNameTest = NSPredicate(format:"SELF MATCHES %@", fullNameRegex)
        let result = fullNameTest.evaluate(with: name)
//        print (">> name valid: \(result)")
        return result
    }
    
    var isEmailValid: Bool {
//        return !email.isEmpty
        let emailRegEx = Constants.emaiMask
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result =  emailTest.evaluate(with: email)
//        print (">> email valid: \(result)")
        return result
    }
    
    var isPhoneValid: Bool {
//        return !phone.isEmpty
//        "+38 (XXX) XXX - XX - XX"
        let phoneNumberRegex = Constants.phoneMask
        let phoneNumberTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        let result =  phoneNumberTest.evaluate(with: phone)
//        print (">> phone valid: \(result)")
        return result
    }
    
    var isValidated: Bool {
        return isNameValid && isEmailValid && isPhoneValid
    }
    
    // MARK: debug
    
    func status() {
        print(">> \(name)")
        print(">> \(email)")
        print(">> \(phone)")
        print(">> \(positionID)")
        print(">> \(photo)")
    }
}
