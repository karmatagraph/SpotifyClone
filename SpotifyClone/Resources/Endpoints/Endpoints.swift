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
    case album(id: String?)
    case playlist(id: String?)
    case profile
    case currentUserPlaylist
    case addItemsToPlaylist(id: String?)
    case createPlaylist(id: String?)
    case search(queryText: String?)
    case categories
    case categoryPlaylist(id: String?)
    case newRelease
    case featuredPlaylist
    case recommendations
    case recommendationsGenre
}

extension Endpoints: Endpoint {
    var path: String {
        switch self {
        case .album(let id):
            return "albums\(id == nil ? "" : "/\(id ?? "")")"
        case .playlist(let id):
            return "playlists\(id == nil ? "" : "/\(id ?? "")")"
        case .profile:
            return "me"
        case .currentUserPlaylist:
            return "me/playlists"
        case .addItemsToPlaylist(let id):
            return "playlists/\(id == nil ? "" : "\(id ?? "")")/tracks"
        case .createPlaylist(let id):
            return "users/\(id == nil ? "" : "\(id ?? "")")/playlists"
        case .search(let queryText):
            return "search?limit=10&type=album,track,artist,playlist,show,episode&q=\(queryText == nil ? "" : "\(queryText ?? "")")"
        case .categories:
            return "browse/categories?limit=30"
        case .categoryPlaylist(let id):
            return "browse/categories\(id == nil ? "" : "/\(id ?? "")")/playlists"
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
