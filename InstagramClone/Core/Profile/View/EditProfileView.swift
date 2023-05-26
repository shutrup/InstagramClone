//
//  EditProfileView.swift
//  InstagramClone
//
//  Created by Шарап Бамматов on 25.05.2023.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var vm: EditProfileViewModel
    
    init(user: User) {
        self._vm = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }

    
    var body: some View {
        VStack {
            header
            
            photosPicker
            
            textFields
            
            Spacer()
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: User.MOCK_USERS[0])
    }
}

extension EditProfileView {
    private var header: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }

                Spacer()
                
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    Task {
                        try await vm.updateUserData()
                        dismiss()
                    }
                } label: {
                    Text("Done")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
            }
            .padding(.horizontal)
            
            Divider()
        }
    }
    private var photosPicker: some View {
        PhotosPicker(selection: $vm.selectedImage) {
            VStack {
                if let image = vm.profileImage {
                    CircularProfileImageView(user: vm.user, size: .large)
                } else {
                    CircularProfileImageView(user: vm.user, size: .large)
                }
                
                Text("Edit profile picture")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Divider()
            }
        }
        .padding(.vertical, 8)
    }
    private var textFields: some View {
        VStack {
            EditProfileRowView(title: "Name", placeholder: "Enter you name...", text: $vm.fullname)
            
            EditProfileRowView(title: "Bio", placeholder: "Enter you bio...", text: $vm.bio)
        }
        .padding(.horizontal)
    }
}
