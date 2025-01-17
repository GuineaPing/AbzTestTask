//
//  ApiService.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 08.01.2025.
//

import Foundation
import Combine

// API calls

class APIService {
    
    // token
    func fetchTokenData() -> AnyPublisher<TokenModel, Error> {
        guard let url = URL(string: "\(Constants.baseURL)/\(EndpointType.token.endpoint)") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: TokenModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    // users list
    func fetchUsersData() -> AnyPublisher<UsersModel, Error> {
        guard let url = URL(string: "\(Constants.baseURL)/\(EndpointType.users.endpoint)") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: UsersModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    // positions list
    func fetchPositionsData() -> AnyPublisher<PositionsModel, Error> {
        guard let url = URL(string: "\(Constants.baseURL)/\(EndpointType.positions.endpoint)") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: PositionsModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
