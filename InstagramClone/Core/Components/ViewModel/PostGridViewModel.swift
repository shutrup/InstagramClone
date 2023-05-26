//
//  PostGridViewModel.swift
//  InstagramClone
//
//  Created by Шарап Бамматов on 26.05.2023.
//

import Foundation

@MainActor
final class PostGridViewModel: ObservableObject {
    private let user: User
    @Published var posts: [Post] = []
    
    init(user: User) {
        self.user = user
        
        Task {
            try await fetchUserPosts()
        }
    }
    
    func fetchUserPosts() async throws {
        self.posts = try await PostService.fetchUserPosts(uid: user.id)
        
        for i in 0..<posts.count {
            posts[i].user = self.user
        }
    }
}
