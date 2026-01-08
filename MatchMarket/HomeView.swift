import SwiftUI

struct HomeView: View {

    let categories = ["Amazing views", "Cabins", "Trending", "Beach", "Design"]
    let listings = [
        Listing(imageName: "card1", title: "Pot", location: "A Good Pot", price: "$25"),
        Listing(imageName: "card2", title: "Couch", location: "A Good Couch", price: "$300"),
        Listing(imageName: "card3", title: "Bunk Bed", location: "A Good Bunk Bed", price: "$150"),
        Listing(imageName: "card4", title: "Unicycle", location: "A Good Unicycle", price: "$6000"),
        Listing(imageName: "card5", title: "Small Child In Washing Machine", location: "A Good Small Child In Washing Machine", price: "$67")
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {

                    // Search Bar
                    SearchBarView()

                    // Categories
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(categories, id: \.self) { category in
                                CategoryChip(title: category)
                            }
                        }
                        .padding(.horizontal)
                    }

                    // Listings
                    VStack(spacing: 24) {
                        ForEach(1..<6) { index in
                            ListingCardView(
                                imageName: "card\(index)",
                                title: "Modern Apartment",
                                location: "New York",
                                price: "$\(120 + index * 20) / night"
                            )
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
            }
            .navigationBarHidden(true)
        }
    }
}

