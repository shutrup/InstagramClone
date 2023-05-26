//
//  ImageUploader.swift
//  InstagramClone
//
//  Created by Шарап Бамматов on 25.05.2023.
//

import SwiftUI
import Firebase
import FirebaseStorage

@MainActor
struct ImageUploader {
    static func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            print(url.absoluteString)
            return url.absoluteString
        } catch {
            print("DEBUG: Failed to upload image with error \(error)")
            return nil
        }
    }
}
