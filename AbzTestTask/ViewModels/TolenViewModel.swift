//
//  TolenViewModel.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 08.01.2025.
//

import SwiftUI
import Combine

class TokenViewModel: ObservableObject {
    @Published var token: String = ""
    @Published var isLoading: Bool = false
    @Published var error: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    private let apiService: APIService

    init(apiService: APIService = APIService()) {
        self.apiService = apiService
    }

    func fetchTokenData() {
        isLoading = true
        error = nil
        
        apiService.fetchTokenData()
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    self?.error = ">> failed to fetch token: \(error.localizedDescription)"
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] tokenData in
                self?.token = tokenData.token
            })
            .store(in: &cancellables)
    }
}
