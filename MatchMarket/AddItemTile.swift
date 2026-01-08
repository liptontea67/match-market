import SwiftUI
struct AddItemTile: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
                    .foregroundColor(.blue)
                
                Text("Add Item")
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
            .frame(maxWidth: .infinity, minHeight: 140)
            .background(Color(.systemGray6))
            .cornerRadius(12)
        }
    }
}
