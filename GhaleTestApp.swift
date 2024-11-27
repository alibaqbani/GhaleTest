//
//  GhaleTestApp.swift
//  GhaleTest
//
//  Created by Ali Baqbani on 11/25/24.
//

import SwiftUI

@main
struct GhaleTestApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                VStack {
                    NavigationLink("Weather") {
                        WeatherView()
                    }
                    .padding()
                    
                    NavigationLink("Settings") {
                        SettingsView()
                    }
                    .padding()
                }
            }
        }
    }
}


