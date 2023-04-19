//
//  AlbumsFeed.swift
//  Storyboard-1
//
//  Created by Seiken Dojo on 2023-03-21.
//

import Foundation

struct AlbumsFeed: Codable {
    let title: String
    let id: String
    let author: Author
    let links: [[String: String]]
    let copyright: String
    let country: String
    let icon: String
    let updated: String
    let results: [Album]
}
