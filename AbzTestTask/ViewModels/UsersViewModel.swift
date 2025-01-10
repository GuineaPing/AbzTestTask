//
//  UsersViewModel.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 08.01.2025.
//

import SwiftUI
import Combine

class UsersViewModel: ObservableObject {
    @Published var users = [UserModel]()
    @Published var isLoading: Bool = false
    @Published var error: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    private let apiService: APIService

    init(apiService: APIService = APIService()) {
        self.apiService = apiService
    }

    func fetchUserData() {
        isLoading = true
        error = nil
        
        apiService.fetchUsersData()
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    self?.error = "failed to fetch users: \(error.localizedDescription)"
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] usersData in
                self?.users = usersData.users
            })
            .store(in: &cancellables)
    }
}
