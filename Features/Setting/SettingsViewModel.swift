//
//  SettingsViewModel.swift
//  GhaleTest
//
//  Created by Ali Baqbani on 11/26/24.
//


import SwiftUI
import Combine

@Observable @MainActor
class SettingsViewModel {
    var items: [Item] = []
    
    init() {
        Task {
            await loadSettings()
        }
    }
    
    func loadSettings() async {
        if let data = UserDefaults.standard.data(forKey: "settings") {
            if let decodedItems = try? JSONDecoder().decode([Item].self, from: data) {
                items = decodedItems
            }
        } else {
            items = [
                Item(config: Config(isOne: false, selectedOption: 1, options: [1, 2, 3])),
                Item(config: Config(isOne: false, selectedOption: 1, options: [1, 2, 3])),
                Item(config: Config(isOne: false, selectedOption: 1, options: [1, 2, 3]))
            ]
        }
    }
    
    func saveSettings() async {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: "settings")
        }
    }
    
    var allItemsState: String {
        items.enumerated().map { index, item in
            let switchState = item.config.isOne ? "ON" : "OFF"
            let option = item.config.selectedOption
            return "Item \(index + 1): Switch is \(switchState), Option selected: \(option)"
        }
        .joined(separator: "\n")
    }
}
