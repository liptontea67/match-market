import SwiftUI
import SwipeCardsKit

struct SwipeView: View {
    // Sample data
    @State private var cards = [
        Card(id: 1, title: "Pot", subtitle: "$25", description: "A sturdy ceramic pot for cooking.", color: .blue, imageName: "card1"),
        Card(id: 2, title: "Couch", subtitle: "$300", description: "Comfortable two-seater couch in gray.", color: .purple, imageName: "card2"),
        Card(id: 3, title: "Bunkbed", subtitle: "$150", description: "Space-saving bunk bed for kids.", color: .orange, imageName: "card3"),
        Card(id: 4, title: "Unicycle", subtitle: "$6000", description: "A single-wheel cycle for balance pros.", color: .green, imageName: "card4"),
        Card(id: 5, title: "Small child in washing machine", subtitle: "$67", description: "Cheap.", color: .blue, imageName: "card5")
    ]
    @State private var selectedCard: Card?
    @State private var popTrigger: CardSwipeDirection?
    
    var body: some View {
        VStack {
            CardSwipeView(items: $cards, selectedItem: $selectedCard, popTrigger: $popTrigger) { card, progress, direction in
                // Card content
                ZStack {
                    // Background image
                    Image(card.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 400, height: 700)
                        .clipped()
                        .cornerRadius(10)
                    
                    // Dark overlay (makes text readable)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.black.opacity(0.25))
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Spacer() // pushes content to bottom
                        
                        Text(card.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                       
                        Text(card.subtitle)
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.9))

                        Text(card.description)
                            .font(.footnote)
                            .foregroundColor(.white.opacity(0.85))

                        Text(direction == .left ? "NOPE" : "LIKE")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(direction == .left ? .red : .green)
                            .cornerRadius(20)
                            .opacity(progress)
                    }
                  
                    .padding(20)
                    
                    .frame(width: 400, height: 70)
                    .shadow(radius: 5)
                    
                    .frame(width: 400, height: 700)
                    .shadow(radius: 5)
                }
            }
            .onSwipeEnd { card, direction in
                print("Swiped \(direction) on card: \(card.title)")
            }
            .onNoMoreCardsLeft {
                print("No more cards left!, dismiss?")
            }
        }
    }
    
    // Sample card model
    struct Card: Identifiable, Hashable {
        let id: Int
        let title: String
        let subtitle: String
        let description: String
        let color: Color
        let imageName: String
    }
    
    
}

#Preview {
    SwipeView()
}

