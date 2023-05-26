//
//  Profile.swift
//  InstagramClone
//
//  Created by Шарап Бамматов on 12.05.2023.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    var body: some View {
        VStack {
            ProfileHeaderView(user: user)
            
            ScrollView {
                
                PostGridView(user: user)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS.first!)
    }
}
