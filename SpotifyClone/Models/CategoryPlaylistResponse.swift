//
//  CategoryPlaylistResponse.swift
//  SpotifyClone
//
//  Created by karma on 8/5/22.
//

import Foundation

struct CategoryPlaylistResponse: Codable {
    let playlists: PlaylistResponse
}


/*
 {
   "playlists": {
     "href": "https://api.spotify.com/v1/browse/categories/toplists/playlists?country=SE&offset=5&limit=1",
     "items": [
       {
         "collaborative": false,
         "description": "The world's biggest dance hits. Cover: KAYTRANADA",
         "external_urls": {
           "spotify": "https://open.spotify.com/playlist/37i9dQZF1DX4dyzvuaRJ0n"
         },
         "href": "https://api.spotify.com/v1/playlists/37i9dQZF1DX4dyzvuaRJ0n",
         "id": "37i9dQZF1DX4dyzvuaRJ0n",
         "images": [
           {
             "height": null,
             "url": "https://i.scdn.co/image/ab67706f00000003ce1738ed9dceb61984be7abe",
             "width": null
           }
         ],
         "name": "mint",
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
         "snapshot_id": "MTY1OTY3MjA2MCwwMDAwMDAwMGFjYWRiMTY1YTc1MmE3NzZmNWFmZGY4NzYxYWNjYjJl",
         "tracks": {
           "href": "https://api.spotify.com/v1/playlists/37i9dQZF1DX4dyzvuaRJ0n/tracks",
           "total": 88
         },
         "type": "playlist",
         "uri": "spotify:playlist:37i9dQZF1DX4dyzvuaRJ0n"
       }
     ],
     "limit": 1,
     "next": "https://api.spotify.com/v1/browse/categories/toplists/playlists?country=SE&offset=6&limit=1",
     "offset": 5,
     "previous": "https://api.spotify.com/v1/browse/categories/toplists/playlists?country=SE&offset=4&limit=1",
     "total": 13
   }
 }
 */
