//
//  SearchViewModel.swift
//  InstagramClone
//
//  Created by Шарап Бамматов on 24.05.2023.
//

import Foundation

final class SearchViewModel: ObservableObject {
    @Published var users: [User] = []
    
    init() {
        Task {
            try await fetchAllUser()
        }
    }
    
    @MainActor
    func fetchAllUser() async throws {
        self.users = try await UserService.fetchAllUser()
    }
}
