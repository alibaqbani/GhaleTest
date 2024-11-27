//
//  ImageTextView.swift
//  GhaleTest
//
//  Created by Ali Baqbani on 11/26/24.
//


import SwiftUI

struct ImageTextView: View {
    
    let imageName: String
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundStyle(.purple)
                .font(.system(size: 24))
            VStack {
                Text(title)
                Text(subtitle)
            }
        }
    }
}