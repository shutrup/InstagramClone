//
//  FeedViewModel.swift
//  InstagramClone
//
//  Created by Шарап Бамматов on 25.05.2023.
//

import Foundation
import Firebase

@MainActor
final class FeedViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    init() {
        Task {
            try await fetchPost()
        }
    }
    
    func fetchPost() async throws {
        self.posts = try await PostService.fetchFeedPosts()
    }
}
