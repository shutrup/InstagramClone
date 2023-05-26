//
//  SearchView.swift
//  InstagramClone
//
//  Created by Шарап Бамматов on 15.05.2023.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var vm = SearchViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                listUsers
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SearchView()
        }
    }
}

extension SearchView {
    private var listUsers: some View {
        LazyVStack(spacing: 12) {
            ForEach(vm.users) { user in
                NavigationLink(value: user) {
                    HStack {
                        CircularProfileImageView(user: user, size: .xSmall)
                        
                        VStack(alignment: .leading) {
                            Text(user.username)
                                .fontWeight(.semibold)
                            
                            if let fullname = user.fullname {
                                Text(fullname)
                            }
                        }
                        .font(.footnote)
                        
                        Spacer()
                    }
                    .foregroundColor(.black)
                    .padding(.horizontal)
                }
            }
        }
        .navigationDestination(for: User.self, destination: { user in
            ProfileView(user: user)
        })
        .padding(.top, 8)
        .searchable(text: $searchText, prompt: "Search....")
    }
}
