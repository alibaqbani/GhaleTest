//
//  ItemRow.swift
//  GhaleTest
//
//  Created by Ali Baqbani on 11/26/24.
//


import SwiftUI
import Combine

struct ItemRow: View {
    @Binding var item: Item

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Picker("Option", selection: $item.config.selectedOption) {
                    ForEach(item.config.options, id: \.self) { number in
                        Text("\(number)").tag(number)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .disabled(!item.config.isOne)
                Spacer()
                Toggle("", isOn: $item.config.isOne)
                    .fixedSize()
            }
            // Text view to display the item's state
            Text("Switch is \(item.config.isOne ? "ON" : "OFF"), Option selected: \(item.config.selectedOption)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 4)
    }
}
