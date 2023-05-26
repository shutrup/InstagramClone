//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by Шарап Бамматов on 22.05.2023.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    @State var showEditProfile: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            userStats
            
            userDescription
            
            editProfileButton
            
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MOCK_USERS[0])
    }
}

extension ProfileHeaderView {
    private var userStats: some View {
        HStack {
            CircularProfileImageView(user: user, size: .large)
            
            Spacer()
            
            HStack(spacing: 8) {
                UserStatView(value: 3, title: "Posts")
                
                UserStatView(value: 5, title: "Followers")
                
                UserStatView(value: 7, title: "Following")
            }
        }
        .padding(.horizontal)
    }
    private var userDescription: some View {
        VStack(alignment: .leading, spacing: 4) {
            if let fullname = user.fullname {
                Text(fullname )
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            
            if let bio = user.bio {
                Text(bio)
                    .font(.footnote)
            }
            
            Text(user.username) 
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
    private var editProfileButton: some View {
        Button {
            if user.isCurrentUser {
                showEditProfile.toggle()
            } else {
                print("follow User")
            }
        } label: {
            Text(user.isCurrentUser ? "Edit profile" : "Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(height: 32)
                .frame(maxWidth: .infinity)
                .background(user.isCurrentUser ? .white : Color(.systemBlue))
                .foregroundColor(user.isCurrentUser ? .black : .white)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1)
                }
            
        }
        .padding(.horizontal)
    }
}
