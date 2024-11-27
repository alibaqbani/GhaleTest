//
//  ContentView.swift
//  GhaleTest
//
//  Created by Ali Baqbani on 11/25/24.
//


import SwiftUI

struct ContentView: View {
    @State private var isShowingWeather = false
    @State private var isShowingSettings = false

    var body: some View {
        VStack {
            Button("Weather") {
                isShowingWeather = true
            }
            .sheet(isPresented: $isShowingWeather) {
                WeatherView()
            }

            Button("Settings") {
                isShowingSettings = true
            }
            .sheet(isPresented: $isShowingSettings) {
                SettingsView()
            }
        }
    }
}
