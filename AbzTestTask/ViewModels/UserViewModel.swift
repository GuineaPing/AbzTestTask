//
//  UploadUserViewModel.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 12.01.2025.
//

import SwiftUI
import Combine
import UIKit

class UserViewModel: ObservableObject {
    @Published private var userData: UserModel?
    @Published var errorMessage: String?
    @Published var isShowingImagePicker = false
    @Published var status: StatusType = .undefined
    
    private var cancellables = Set<AnyCancellable>()
    
    func uploadUser(token: String, user: UserModel, selectedImage: UIImage?) {
        guard let url = URL(string: "\(Constants.baseURL)/\(EndpointType.users.endpoint)") else {
            self.errorMessage = "Invalid URL"
            return
        }
        status = .undefined
        errorMessage = nil
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let boundary = "Boundary-\(UUID().uuidString)"
        
        // Headers
        request.setValue(token, forHTTPHeaderField: "Token")
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        // Multipart form data
        var body = Data()
        
        func appendFormData(_ data: Data, withName name: String, fileName: String? = nil, mimeType: String? = nil) {
            body.append("--\(boundary)\r\n".data(using: .utf8)!)
            body.append("Content-Disposition: form-data; name=\"\(name)\"".data(using: .utf8)!)
            if let fileName = fileName {
                body.append("; filename=\"\(fileName)\"".data(using: .utf8)!)
            }
            body.append("\r\n".data(using: .utf8)!)
            if let mimeType = mimeType {
                body.append("Content-Type: \(mimeType)\r\n\r\n".data(using: .utf8)!)
            } else {
                body.append("\r\n".data(using: .utf8)!)
            }
            body.append(data)
            body.append("\r\n".data(using: .utf8)!)
        }
        
        func log() {
            if let bodyString = String(data: body, encoding: .utf8) {
                print(">> \(bodyString)")
            } else {
                print(">> xxx bodyString xxx")
            }
            print(">> length: \(body.count)")
            print(">>")
        }
        
        appendFormData(user.name.data(using: .utf8)!, withName: "name")
        appendFormData(user.email.data(using: .utf8)!, withName: "email")
        appendFormData(user.phoneClean.data(using: .utf8)!, withName: "phone")
        appendFormData("\(user.positionID)".data(using: .utf8)!, withName: "position_id")
        
        if let image = selectedImage, let imageData = image.jpegData(compressionQuality: 0.8) {
            appendFormData(imageData, withName: "photo", fileName: "photo.jpg", mimeType: "image/jpeg")
        }
        
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
//        log()
    
        request.httpBody = body
        
        URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse else {
                    throw URLError(.badServerResponse)
                }
                
                if (200...299).contains(httpResponse.statusCode) {
                    return element.data
                } else if httpResponse.statusCode == 422 {
                    // Here, you might want to handle the 422 error specifically
                    if let errorResponse = try? JSONDecoder().decode(UsersError422.self, from: element.data) {
                        throw APIError.unprocessableEntity(errorResponse.failsList)
                    } else {
                        if let errorResponse = try? JSONDecoder().decode(UsersError.self, from: element.data) {
                            throw APIError.unprocessableEntity([errorResponse.message])
                        } else {
                            throw APIError.unprocessableEntity(["Unknown 422 error message"])
                        }
                    }
                } else {
                    if let errorResponse = try? JSONDecoder().decode(UsersError.self, from: element.data) {
                        throw APIError.unprocessableEntity([errorResponse.message])
                    } else {
                        throw URLError(.badServerResponse)
                    }
                }
            }
            .decode(type: NewUserModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = "\(error)"
                    self.statusUpdate()
                }
            }, receiveValue: { user in
                _ = user
                self.status = .userRegistred
                
            })
            .store(in: &cancellables)
    }
    
    func statusUpdate() {
        if errorMessage == nil {
            return
        }
        if errorMessage!.contains("phone or email already exist") {
            // "User with this phone or email already exist"
            status = .emailTaken
        }

    }
}
