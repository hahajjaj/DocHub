//
//  ActivityView.swift
//  DocHub
//
//  Created by Hamza Hajjaj on 07/07/2021.
//

import SwiftUI

struct ActivityView: View {
//    @Binding var item: Item
    var activite: Result
    var body: some View {
        ZStack(alignment: .leading) {
            Color.white
                .cornerRadius(12)
            Activity_Cell_View(activite: activite)
        }
        .fixedSize(horizontal: false, vertical: true)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}


struct CardContentView: View {
    var activite: Result

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("item.name")
                    .font(.title)
                    .fixedSize(horizontal: false, vertical: true)
                Text("item.summary")
                    .font(.caption)
            }
        }
        .padding()
    }
}

