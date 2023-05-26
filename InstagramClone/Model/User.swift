//
//  User.swift
//  InstagramClone
//
//  Created by Шарап Бамматов on 18.05.2023.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    var isCurrentUser: Bool {
        guard let currentUId = Auth.auth().currentUser?.uid else { return false }
        return currentUId == id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "batman", profileImageUrl: "batman", fullname: "Bruse wayne", bio: "Gotham Dark Nights", email: "batman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "batman2", profileImageUrl: "batman2", fullname: "Bruse wayne2", bio: "Gotham Dark Nights22", email: "batma222n@gmail.com"),
        .init(id: NSUUID().uuidString, username: "venom", profileImageUrl: "venom", fullname: "Edi Brokc", bio: "Да это веном ааааа Dark Nights", email: "fasdf@gmail.com"),
        .init(id: NSUUID().uuidString, username: "venom2", profileImageUrl: "venom2", fullname: "EDi Brodk2", bio: "Это тоже веном но только 2", email: "aaaaaa@gmail.com"),
        .init(id: NSUUID().uuidString, username: "blackpanter", profileImageUrl: "blackpanter", fullname: "WUAAAAA", bio: "ТЧААААЛАА умер", email: "fasdfasdfasdf@gmail.com")
    ]
}
