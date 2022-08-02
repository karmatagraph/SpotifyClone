//
//  NewReleasesCellViewModel.swift
//  SpotifyClone
//
//  Created by karma on 8/1/22.
//

import Foundation

struct NewReleasesCellViewModel: Codable {
    let name: String
    let artworkURL: URL?
    let numberOfTracks: Int
    let artistName: String
}


