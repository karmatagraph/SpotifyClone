//
//  Endpoints.swift
//  SpotifyClone
//
//  Created by karma on 7/28/22.
//

import Foundation

struct API {
    static let url = "https://api.spotify.com/"
    static let tokenUrl = "https://accounts.spotify.com/api/token"
}

protocol Endpoint{
    var path: String { get }
    var url: URL { get }
}

enum Endpoints {
    case profile
}

extension Endpoints: Endpoint {
    var path: String {
        switch self {
        case .profile:
            return "v1/me"
        }
    }
    
    var url: URL {
        return URL(string: "\(API.url)\(path)")!
    }
}
