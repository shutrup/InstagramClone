//
//  CircularProfileImageView.swift
//  InstagramClone
//
//  Created by Шарап Бамматов on 25.05.2023.
//

import SwiftUI
import Kingfisher

struct CircularProfileImageView: View {
    let user: User
    let size: ProfileImageSize
    
    var body: some View {
        if let imageURL = user.profileImageUrl {
            KFImage(URL(string: imageURL))
                .resizable()
                .foregroundColor(.white)
                .background(.gray)
                .clipShape(Circle())
                .frame(width: size.dimension, height: size.dimension)
        } else {
            Image(systemName: "person.circle")
                .resizable()
                .foregroundColor(.white)
                .background(.gray)
                .clipShape(Circle())
                .frame(width: size.dimension, height: size.dimension)
        }
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(user: User.MOCK_USERS[0], size: .large)
    }
}

enum ProfileImageSize {
    case xSmall
    case small
    case medium
    case large
    
    var dimension: CGFloat {
        switch self {
        case .xSmall:
            return 40
        case .small:
            return 48
        case .medium:
            return 64
        case .large:
            return 80
        }
    }
}
