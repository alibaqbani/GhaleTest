//
//  SettingsView.swift
//  GhaleTest
//
//  Created by Ali Baqbani on 11/26/24.
//


import SwiftUI
import Combine

struct SettingsView: View {
    @State private var viewModel = SettingsViewModel()

    var body: some View {
        VStack {
            List {
                ForEach($viewModel.items) { $item in
                    ItemRow(item: $item)
                }
            }
            Text(viewModel.allItemsState)
                .padding()
        }
        .navigationTitle("Setting")
        .onChange(of: viewModel.items) {
            Task {
                await viewModel.saveSettings()
            }
        }
    }
}

#Preview {
    SettingsView()
        .preferredColorScheme(.dark)
}
