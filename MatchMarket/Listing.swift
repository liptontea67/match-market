//
//  Listing.swift
//  MatchMarket
//
//  Created by Girl Geek on 8/1/2026.
//

import Foundation

struct Listing: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let location: String
    let price: String
}
