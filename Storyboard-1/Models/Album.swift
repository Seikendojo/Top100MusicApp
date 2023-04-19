//
//  Album.swift
//  Storyboard-1
//
//  Created by Seiken Dojo on 2023-03-21.
//

import Foundation

struct Album: Codable {
    let artistName: String
    let id: String
    let name: String
    let releaseDate: String
    let kind: String
    let artistId: String
    let artistUrl: String
    let contentAdvisoryRating: String?
    let artworkUrl100: String
    let genres: [Genre]
    let url: String
}
