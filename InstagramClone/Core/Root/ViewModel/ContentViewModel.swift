//
//  ContentViewModel.swift
//  InstagramClone
//
//  Created by Шарап Бамматов on 23.05.2023.
//

import Foundation
import Firebase
import Combine

@MainActor
final class ContentViewModel: ObservableObject {
    private let service = AuthService.shared
    private var cancellable = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        setupSubscribers()
    }
    
    func setupSubscribers() {
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellable)
        
        service.$currentUser.sink { [weak self] currentuser in
            self?.currentUser = currentuser
        }
        .store(in: &cancellable)
    }
}
