//
//  RegistrationViewModel.swift
//  InstagramClone
//
//  Created by Шарап Бамматов on 24.05.2023.
//

import Foundation

@MainActor
final class RegistrationViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, userName: username)
        
        username = ""
        email = ""
        password = ""
    }
}
