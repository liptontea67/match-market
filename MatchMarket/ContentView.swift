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
                    Label("For You Page", systemImage: "arrow.up")
                }
           
            InboxView()
                .tabItem {
                    Label("Messages", systemImage: "message")
                }

            AccountView()
                 .tabItem {
                     Label("Account", systemImage: "person")
                 }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
