import SwiftUI

struct Conversation: Identifiable {
    let id = UUID()
    let name: String
    let lastMessage: String
}

struct InboxView: View {

    let conversations: [Conversation] = [
        Conversation(name: "Alex", lastMessage: "Hey there!"),
        Conversation(name: "Jamie", lastMessage: "Is this still available?"),
        Conversation(name: "Sam", lastMessage: "Thanks!")
    ]

    var body: some View {
        NavigationStack {
            List(conversations) { convo in
                NavigationLink {
                    MessagesView() // 👈 YOUR EXISTING CHAT VIEW
                } label: {
                    HStack {
                        Circle()
                            .fill(.gray.opacity(0.3))
                            .frame(width: 44, height: 44)
                            .overlay(
                                Text(convo.name.prefix(1))
                                    .font(.headline)
                            )

                        VStack(alignment: .leading) {
                            Text(convo.name)
                                .fontWeight(.semibold)
                            Text(convo.lastMessage)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Messages")
        }
    }
}
