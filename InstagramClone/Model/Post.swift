//
//  Post.swift
//  InstagramClone
//
//  Created by Шарап Бамматов on 19.05.2023.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID() .uuidString,
            caption: "Maaan its ool ",
            likes: 15, imageUrl: "batman",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[0]
            ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID() .uuidString,
            caption: "Batman its cool",
            likes: 22, imageUrl: "batman2",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[1]
            ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID() .uuidString,
            caption: "Tcharalla Manhine",
            likes: 32, imageUrl: "blackpanter",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[1]
            ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID() .uuidString,
            caption: "Tcharalla",
            likes: 52, imageUrl: "blackpanter2",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[2]
            ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID() .uuidString,
            caption: "Edit Brok",
            likes: 11, imageUrl: "venom",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[3]
            )
    ]
}
