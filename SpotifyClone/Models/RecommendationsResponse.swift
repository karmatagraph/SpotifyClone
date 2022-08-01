//
//  RecommendationsResponse.swift
//  SpotifyClone
//
//  Created by karma on 8/1/22.
//

import Foundation

// MARK: - Welcome
struct RecommendationsResponse: Codable {
    let seeds: [Seed]?
    let tracks: [AudioTrack]?
}

// MARK: - Seed
struct Seed: Codable {
    let afterFilteringSize, afterRelinkingSize: Int?
    let href, id: String?
    let initialPoolSize: Int?
    let type: String?
}


