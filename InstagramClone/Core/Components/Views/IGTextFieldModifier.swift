//
//  IGTextFieldModifier.swift
//  InstagramClone
//
//  Created by Шарап Бамматов on 18.05.2023.
//

import SwiftUI

struct IGTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
         content
            .font(.headline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}

