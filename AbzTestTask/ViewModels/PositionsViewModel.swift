//
//  UsersViewModel.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 08.01.2025.
//

import SwiftUI
import Combine

class PositionsViewModel: ObservableObject {
    @Published var positions = [PositionModel]()
    @Published var isLoading: Bool = false
    @Published var error: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    private let apiService: APIService

    init(apiService: APIService = APIService()) {
        self.apiService = apiService
    }

    func fetchPositionsData() {
        isLoading = true
        error = nil
        
        apiService.fetchPositionsData()
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    self?.error = "failed to fetch users: \(error.localizedDescription)"
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] positionsData in
                self?.positions = positionsData.positions
            })
            .store(in: &cancellables)
    }
}
