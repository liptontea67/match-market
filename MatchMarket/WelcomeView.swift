import SwiftUI

struct WelcomeView: View {
    @State private var enterApp = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Spacer()

                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350)
                    .foregroundColor(.blue)

                Text("Welcome")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Buy, sell, and chat easily")
                    .foregroundColor(.secondary)

                Spacer()

                Button {
                    enterApp = true
                } label: {
                    Text("Enter App")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
            .padding()
            .navigationDestination(isPresented: $enterApp) {
                ContentView()
            }
        }
    }
}

#Preview {
    WelcomeView()
}
