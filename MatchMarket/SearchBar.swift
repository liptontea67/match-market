//
//  SearchBar.swift
//  MatchMarket
//
//  Created by Girl Geek on 8/1/2026.
//
import SwiftUI
struct SearchBar: View {
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "magnifyingglass")

            VStack(alignment: .leading, spacing: 2) {
                Text("Where to?")
                    .fontWeight(.semibold)
                Text("Anywhere · Any week · Add guests")
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer()

            Image(systemName: "slider.horizontal.3")
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.3))
        )
        .padding(.horizontal)
    }
}

#Preview {
    SearchBar()
}
