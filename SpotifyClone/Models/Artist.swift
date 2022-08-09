//
//  Artist.swift
//  SpotifyClone
//
//  Created by karma on 7/27/22.
//

import Foundation

struct Artist: Codable {
    let id: String
    let name: String
    let images: [ApiImage]?
    let external_urls: [String:String]
}
