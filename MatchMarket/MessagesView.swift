import SwiftUI

struct ChatMessage: Identifiable, Hashable {
    let id = UUID()
    let text: String
    let isMe: Bool
    let timestamp: Date = .init()
}

struct MessagesView: View {
    @State private var messages: [ChatMessage] = [
        .init(text: "Hey there!", isMe: false),
        .init(text: "Hi! How’s it going?", isMe: true),
        .init(text: "Pretty good. Working on a messaging view.", isMe: false)
    ]
    @State private var draft: String = ""

    var body: some View {
        VStack(spacing: 0) {
            // Message list
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 8) {
                        ForEach(messages) { msg in
                            HStack {
                                if msg.isMe { Spacer() }
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(msg.text)
                                        .padding(10)
                                        .background(msg.isMe ? Color.blue : Color.gray.opacity(0.2))
                                        .foregroundStyle(msg.isMe ? .white : .primary)
                                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                                    Text(msg.timestamp, style: .time)
                                        .font(.caption2)
                                        .foregroundStyle(.secondary)
                                }
                                if !msg.isMe { Spacer() }
                            }
                            .id(msg.id)
                            .padding(.horizontal)
                        }
                        .padding(.vertical, 8)
                    }
                }
                .onChange(of: messages) { _, _ in
                    // Auto-scroll to bottom when a new message arrives
                    if let last = messages.last {
                        withAnimation {
                            proxy.scrollTo(last.id, anchor: .bottom)
                        }
                    }
                }
            }

            Divider()

            // Input bar
            HStack(spacing: 8) {
                TextField("Message", text: $draft, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(1...4)

                Button {
                    send()
                } label: {
                    Image(systemName: "paperplane.fill")
                        .font(.system(size: 17, weight: .semibold))
                }
                .disabled(draft.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(.ultraThinMaterial) // nice effect over content
        }
        .navigationTitle("Messages")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func send() {
        let trimmed = draft.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        messages.append(.init(text: trimmed, isMe: true))
        draft = ""
        // Hook: send to backend here
    }
}

#Preview {
    NavigationStack {
        MessagesView()
    }
}
