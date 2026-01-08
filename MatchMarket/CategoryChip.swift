import SwiftUI

struct CategoryChip: View {
    let title: String
    @State private var isSelected: Bool = false

    var body: some View {
        Button(action: { isSelected.toggle() }) {
            Text(title)
                .font(.subheadline.weight(.medium))
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(
                    Capsule(style: .continuous)
                        .fill(isSelected ? Color.accentColor.opacity(0.15) : Color(.secondarySystemBackground))
                )
                .overlay(
                    Capsule(style: .continuous)
                        .stroke(isSelected ? Color.accentColor : Color(.separator), lineWidth: 1)
                )
                .foregroundStyle(isSelected ? Color.accentColor : .primary)
        }
    }
}

#Preview {
    ScrollView(.horizontal) {
        HStack(spacing: 12) {
            ForEach(["Electronics", "Clothings", "Trending", "Furniture", "Housewares"], id: \.self) { c in
                CategoryChip(title: c)
            }
        }
        .padding()
    }
    .background(Color(.systemGroupedBackground))
}
