import SwiftUI

struct SearchBarView: View {
    @State private var query: String = ""

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.secondary)
            TextField("What would you like to buy?", text: $query)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color(.secondarySystemBackground))
        )
        .padding(.horizontal)
    }
}

#Preview {
    VStack(spacing: 16) {
        SearchBarView()
    }
    .padding()
    .background(Color(.systemGroupedBackground))
}
