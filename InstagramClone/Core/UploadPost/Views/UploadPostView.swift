//
//  UploadPostView.swift
//  InstagramClone
//
//  Created by Шарап Бамматов on 22.05.2023.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @StateObject private var vm = UploadPostViewModel()
    
    @State var caption: String = ""
    @State private var imagePickerPresented: Bool = false
    
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    clearPostAndDissmis()
                } label: {
                    Text("Cancel")
                        .fontWeight(.semibold)
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    Task {
                        try await vm.uploadPost(caption: caption)
                        clearPostAndDissmis()
                    }
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)
            
            HStack(spacing: 8) {
                if let image = vm.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                
                TextField("Enter your caption....", text: $caption, axis: .vertical)
            }
            .padding()
            
            Spacer()
        }
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $vm.selectedImage)
    }
    
    func clearPostAndDissmis() {
        caption = ""
        vm.selectedImage = nil
        vm.postImage = nil
        tabIndex = 0
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(0))
    }
}
