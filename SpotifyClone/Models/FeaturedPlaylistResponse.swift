//
//  NewFeaturedPlaylistResponse.swift
//  SpotifyClone
//
//  Created by karma on 7/29/22.
//

import Foundation

/*
 {
   "message": "Redaktionens val",
   "playlists": {
     "href": "https://api.spotify.com/v1/browse/featured-playlists?country=SE&locale=sv_se&timestamp=2014-10-23T09%3A00%3A00&offset=5&limit=1",
     "items": [
       {
         "collaborative": false,
         "description": "Tropical House som får dig att känna sanden mellan tårna.",
         "external_urls": {
           "spotify": "https://open.spotify.com/playlist/37i9dQZF1DWVUxkQFrGCkK"
         },
         "href": "https://api.spotify.com/v1/playlists/37i9dQZF1DWVUxkQFrGCkK",
         "id": "37i9dQZF1DWVUxkQFrGCkK",
         "images": [
           {
             "height": null,
             "url": "https://i.scdn.co/image/ab67706f00000003c90ed4c61348ebba5917a480",
             "width": null
           }
         ],
         "name": "Tropisk House",
         "owner": {
           "display_name": "Spotify",
           "external_urls": {
             "spotify": "https://open.spotify.com/user/spotify"
           },
           "href": "https://api.spotify.com/v1/users/spotify",
           "id": "spotify",
           "type": "user",
           "uri": "spotify:user:spotify"
         },
         "primary_color": null,
         "public": null,
         "snapshot_id": "MTY1OTA0NjIwOCwwMDAwMDAwMDhkMTMyNDhlOGQ0ZTY5N2RhNTZmNTk4YjY0OGMwOWIx",
         "tracks": {
           "href": "https://api.spotify.com/v1/playlists/37i9dQZF1DWVUxkQFrGCkK/tracks",
           "total": 100
         },
         "type": "playlist",
         "uri": "spotify:playlist:37i9dQZF1DWVUxkQFrGCkK"
       }
     ],
     "limit": 1,
     "next": "https://api.spotify.com/v1/browse/featured-playlists?country=SE&locale=sv_se&timestamp=2014-10-23T09%3A00%3A00&offset=6&limit=1",
     "offset": 5,
     "previous": "https://api.spotify.com/v1/browse/featured-playlists?country=SE&locale=sv_se&timestamp=2014-10-23T09%3A00%3A00&offset=4&limit=1",
     "total": 12
   }
 }
 */

struct FeaturedPlaylistResponse: Codable {
    let playlists: PlaylistResponse
}

struct PlaylistResponse: Codable {
    let items: [Playlist]
}

struct User: Codable{
    let display_name: String
    let external_urls: [String:String]
    let id: String
}
