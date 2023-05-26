//
//  EditProfileRowView.swift
//  InstagramClone
//
//  Created by Шарап Бамматов on 25.05.2023.
//

import SwiftUI

struct EditProfileRowView: View {
    var title: String
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
            
            VStack {
                TextField(placeholder, text: $text)
                    
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}

struct EditProfileRowView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileRowView(title: "", placeholder: "", text: .constant(""))
    }
}
