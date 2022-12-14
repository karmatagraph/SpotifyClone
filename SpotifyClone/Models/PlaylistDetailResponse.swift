//
//  PlaylistDetailResponse.swift
//  SpotifyClone
//
//  Created by karma on 8/3/22.
//

import Foundation

struct PlaylistDetailResponse: Codable {
    let external_urls: [String:String]
    let description: String
    let id: String
    let images: [ApiImage]
    let name: String
//    let : Bool
    let owner: User
    let tracks: PlaylistTracksResponse
}

struct PlaylistTracksResponse: Codable {
    let items: [PlaylistItem]
}

struct PlaylistItem: Codable {
    let track: AudioTrack
}
/*
 {
   "collaborative": true,
   "description": "string",
   "external_urls": {
     "spotify": "string"
   },
   "followers": {
     "href": "string",
     "total": 0
   },
   "href": "string",
   "id": "string",
   "images": [
     {
       "url": "https://i.scdn.co/image/ab67616d00001e02ff9ca10b55ce82ae553c8228\n",
       "height": 300,
       "width": 300
     }
   ],
   "name": "string",
   "owner": {
     "external_urls": {
       "spotify": "string"
     },
     "followers": {
       "href": "string",
       "total": 0
     },
     "href": "string",
     "id": "string",
     "type": "user",
     "uri": "string",
     "display_name": "string"
   },
   "public": true,
   "snapshot_id": "string",
   "tracks": {
     "href": "https://api.spotify.com/v1/me/shows?offset=0&limit=20\n",
     "items": [
       {}
     ],
     "limit": 20,
     "next": "https://api.spotify.com/v1/me/shows?offset=1&limit=1",
     "offset": 0,
     "previous": "https://api.spotify.com/v1/me/shows?offset=1&limit=1",
     "total": 4
   },
   "type": "string",
   "uri": "string"
 }
 */
