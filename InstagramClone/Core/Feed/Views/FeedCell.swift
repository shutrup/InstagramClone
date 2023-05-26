//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Шарап Бамматов on 15.05.2023.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    let post: Post
    
    var body: some View {
        VStack {
            header
            
            mainImage
            
            footer

            likes
            
            description
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: .MOCK_POSTS.first!)
    }
}

extension FeedCell {
    private var header: some View {
        HStack {
            if let user = post.user {
                CircularProfileImageView(user: user, size: .xSmall)
                
                Text(user.username )
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            
            Spacer()
        }
        .padding(.leading, 8)
    }
    private var mainImage: some View {
        KFImage(URL(string: post.imageUrl))
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity, maxHeight: 400)
            .clipShape(Rectangle())
    }
    private var footer: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "heart")
                    .imageScale(.large)
            }
            
            Button {
                
            } label: {
                Image(systemName: "bubble.right")
                    .imageScale(.large)
            }

            Button {
                
            } label: {
                Image(systemName: "paperplane")
                    .imageScale(.large)
            }
            
            Spacer()
        }
        .padding(.leading, 8)
        .padding(.top, 4)
        .foregroundColor(.black)
    }
    private var likes: some View {
        Text("\(post.likes)")
            .font(.footnote)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
            .padding(.top, 1)
    }
    private var description: some View {
        VStack {
            HStack {
                Text("\(post.user?.username ?? "") ").fontWeight(.semibold) +
                
                Text(post.caption)
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
            .padding(.top, 1)
            
            Text("6m ago")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundColor(.gray)
        }
    }
}
