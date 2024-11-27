//
//  Item.swift
//  GhaleTest
//
//  Created by Ali Baqbani on 11/26/24.
//


import SwiftUI
import Combine

struct Item: Codable, Identifiable, Equatable {
    var id = UUID()
    var config: Config
}