//
//  PostService.swift
//  InstagramClone
//
//  Created by Шарап Бамматов on 26.05.2023.
//

import Foundation
import Firebase

struct PostService {
    private static let postCollection = Firestore.firestore().collection("posts")
    
    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await postCollection.getDocuments()
        var posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
        
        for i in 0..<posts.count {
            var post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(uid: ownerUid)
            posts[i].user = postUser
        }
        
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let snapshot = try await postCollection.whereField("ownerUid", isEqualTo: uid).getDocuments()
        
        return try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
    }
}
