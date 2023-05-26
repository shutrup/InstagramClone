//
//  LoginView.swift
//  InstagramClone
//
//  Created by Шарап Бамматов on 15.05.2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var vm =  LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Text("Instagram")
                    .font(.system(size: 50))
                    .bold()
                
                textFields
                
                buttons
                
                divider
                
                facebook
                
                Spacer()
                
                Divider()
                
                registration
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension LoginView {
    private var textFields: some View {
        VStack {
            TextField("Enter your email...", text: $vm.email)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
            
            SecureField("Enter your password...", text: $vm.password)
                .font(.headline)
                .modifier(IGTextFieldModifier())
        }
    }
    private var buttons: some View {
        Group {
            Button {
                
            } label: {
                Text("Forgot Password?")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.top)
                    .padding(.trailing, 28)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            Button {
                Task {
                    try await vm.login()
                }
            } label: {
                Text("Log In")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            }
            .padding(.vertical)
        }
    }
    private var divider: some View {
        HStack {
            Rectangle()
                .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
            
            Text("OR")
                .font(.footnote)
                .fontWeight(.semibold)
            
            Rectangle()
                .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
        }
        .foregroundColor(.gray)
    }
    private var facebook: some View {
        HStack {
            Group {
                Image("Facebook")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 12, height: 10)
            }
            .frame(width: 30, height: 30)
            .background(Color(.systemBlue))
            .clipShape(Circle())
            
            Text("Continue with Facebook")
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(Color(.systemBlue))
        }
        .padding(.top, 8)
    }
    private var registration: some View {
        NavigationLink {
            AddEmailView()
                .navigationBarBackButtonHidden(true)
                .environmentObject(vm)
        } label: {
            HStack(spacing: 3) {
                Text("Don't have an account?")
                
                Text("Sign up")
                    .fontWeight(.bold)
            }
            .font(.footnote)
        }
        .padding(.vertical)
    }
}
