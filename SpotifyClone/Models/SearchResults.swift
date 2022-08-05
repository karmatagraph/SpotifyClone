//
//  SearchResults.swift
//  SpotifyClone
//
//  Created by karma on 8/5/22.
//

import Foundation

enum SearchResults {
    case artist(model: Artist)
    case album(model: Album)
    case track(model: AudioTrack)
    case playlist(model: Playlist)
}
