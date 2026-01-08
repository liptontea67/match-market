import SwiftUI
struct ItemTile: View {
    let item: Item
    
    var body: some View {
        VStack {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 120)
                .clipped()
                .cornerRadius(12)
            
            Text(item.name)
                .font(.subheadline)
                .fontWeight(.medium)
        }
    }
}
