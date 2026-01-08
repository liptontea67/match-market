//
//  ContentView.swift
//  MatchMarket
//
//  Created by Girl Geek on 8/1/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            SwipeView()
                .tabItem {
                    Label("Swipe", systemImage: "arrow.up")
                }
            MessagesView()
                .tabItem {
                    Label("Messages", systemImage: "message")
                }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
