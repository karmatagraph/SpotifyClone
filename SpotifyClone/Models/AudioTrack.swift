//
//  AudioTrack.swift
//  SpotifyClone
//
//  Created by karma on 7/27/22.
//

import Foundation

// MARK: - AudioTrack
struct AudioTrack: Codable {
    let id: String
    var album: Album?
    let artists: [Artist]?
    let available_markets: [String]?
    let disc_number, duration_ms: Int?
    let explicit: Bool?
    let external_urls: [String:String]?
    let name: String?
    let popularity: Int?
    let preview_url: String?
}
