//
//  RecommendedGenreResponse.swift
//  SpotifyClone
//
//  Created by karma on 8/1/22.
//

import Foundation

/*
 {
    genres =     (
        acoustic,
        "world-music"
    );
}
 */
struct RecommendedGenreResponse: Codable {
    let genres: [String]
}
