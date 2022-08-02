//
//  Endpoints.swift
//  SpotifyClone
//
//  Created by karma on 7/28/22.
//

import Foundation

struct API {
    static let url = "https://api.spotify.com/v1/"
    static let tokenUrl = "https://accounts.spotify.com/api/token"
}

protocol Endpoint{
    var path: String { get }
    var url: URL { get }
}

enum Endpoints {
    case profile
    case newRelease
    case featuredPlaylist
    case recommendations
    case recommendationsGenre
}

extension Endpoints: Endpoint {
    var path: String {
        switch self {
        case .profile:
            return "me"
        case .newRelease:
            return "browse/new-releases?limit=10"
        case .featuredPlaylist:
            return "browse/featured-playlists?limit=10"
        case .recommendations:
            return "recommendations"
        case .recommendationsGenre:
            return "recommendations/available-genre-seeds"
        }
    }
    
    var url: URL {
        return URL(string: "\(API.url)\(path)")!
    }
}
