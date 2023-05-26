//
//  ContentView.swift
//  InstagramClone
//
//  Created by Шарап Бамматов on 23.05.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ContentViewModel()
    @StateObject var registrVM = RegistrationViewModel()
    
    var body: some View {
        Group {
            if vm.userSession == nil {
                LoginView()
                    .environmentObject(registrVM)
            } else if let user = vm.currentUser {
                MainTabView(user: user)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
