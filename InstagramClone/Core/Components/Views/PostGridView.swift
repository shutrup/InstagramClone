//
//  PostGridView.swift
//  InstagramClone
//
//  Created by Шарап Бамматов on 22.05.2023.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    @StateObject private var vm: PostGridViewModel
    
    init(user: User) {
        self._vm = StateObject(wrappedValue: PostGridViewModel(user: user))
    }
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach(vm.posts, id: \.self) { post in
                KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimension, height: imageDimension)
                    .clipped()
            }
        }
        .onAppear {
            Task {
                try await vm.fetchUserPosts()
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView(user: User.MOCK_USERS[0])
    }
}
