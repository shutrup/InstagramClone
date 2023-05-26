//
//  LoginViewModel.swift
//  InstagramClone
//
//  Created by Шарап Бамматов on 24.05.2023.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
