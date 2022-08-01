//
//  Playlist.swift
//  SpotifyClone
//
//  Created by karma on 7/27/22.
//

import Foundation

struct Playlist: Codable {
    let collaborative: Bool
    let description: String
    let external_urls: [String: String]
    let id: String
    let images: ApiImage
    let name: String
    let owner: User
}
