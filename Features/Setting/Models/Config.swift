//
//  Config.swift
//  GhaleTest
//
//  Created by Ali Baqbani on 11/26/24.
//


import SwiftUI
import Combine

struct Config: Codable, Equatable {
    var isOne: Bool
    var selectedOption: Int
    var options: [Int]
}
