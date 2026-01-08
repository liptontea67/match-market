import SwiftUI

struct AccountView: View {
    
    @State private var profileImage: Image = Image(systemName: "person.circle.fill")
    @State private var username: String = "YourUsername"
    
    // Sample items for sale
    @State private var itemsForSale: [Item] = [
        Item(id: 1, name: "Pot", imageName: "item1"),
        Item(id: 2, name: "Small Child", imageName: "item2"),
        Item(id: 3, name: "Unicycle", imageName: "item3")
    ]
    
    // Sales stats
    @State private var soldCount: Int = 12
    @State private var sellingCount: Int = 3
    
    // Grid layout
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // MARK: - Profile Picture + Username
                    VStack(spacing: 10) {
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                            .onTapGesture {
                                // Optional: Add image picker to change profile picture
                            }
                        
                        Text(username)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    .padding(.top)
                    
                    // MARK: - Sales Stats Tiles
                    HStack(spacing: 20) {
                        StatTile(title: "Sold", value: soldCount)
                        StatTile(title: "Selling", value: sellingCount)
                    }
                    .padding(.horizontal)
                    
                    // MARK: - Items Grid
                    LazyVGrid(columns: columns, spacing: 16) {
                        
                        // First tile: Add new item
                        AddItemTile {
                            // Add a new item action
                            let newItem = Item(id: itemsForSale.count + 1, name: "New Item", imageName: "itemPlaceholder")
                            itemsForSale.append(newItem)
                            sellingCount += 1
                        }
                        
                        // Other items
                        ForEach(itemsForSale) { item in
                            ItemTile(item: item)
                        }
                        
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
            .navigationTitle("Account")
        }
    }
}

#Preview {
    AccountView()
}
