//
//  SearchResultResponse.swift
//  SpotifyClone
//
//  Created by karma on 8/5/22.
//

import Foundation

struct SearchResultResponse: Codable {
    let artists: SearchArtistResponse
    let tracks: SearchTrackResponse
    let albums: SearchAlbumResponse
    let playlists: SearchPlaylistsResponse
//    let shows: SearchShowsResponse
//    let episodes: SearchEpisodeResponse
}

struct SearchArtistResponse: Codable {
    let items: [Artist]
}

struct SearchTrackResponse: Codable {
    let items: [AudioTrack]
}

struct SearchAlbumResponse: Codable {
    let items: [Album]
}

struct SearchPlaylistsResponse: Codable {
    let items: [Playlist]
}

//struct SearchShowsResponse: Codable {
//    let items: [Shows]
//}
//
//struct SearchEpisodeResponse: Codable {
//    let items:
//}

/*
 {
   "artists": {
     "href": "https://api.spotify.com/v1/search?query=remaster%2520track%3ADoxy%2Bartist%3AMiles%2520Davis&type=artist&market=ES&locale=en-US%2Cen%3Bq%3D0.9&offset=5&limit=1",
     "items": [],
     "limit": 1,
     "next": null,
     "offset": 5,
     "previous": "https://api.spotify.com/v1/search?query=remaster%2520track%3ADoxy%2Bartist%3AMiles%2520Davis&type=artist&market=ES&locale=en-US%2Cen%3Bq%3D0.9&offset=4&limit=1",
     "total": 0
   },
   "tracks": {
     "href": "https://api.spotify.com/v1/search?query=remaster%2520track%3ADoxy%2Bartist%3AMiles%2520Davis&type=track&market=ES&locale=en-US%2Cen%3Bq%3D0.9&offset=5&limit=1",
     "items": [],
     "limit": 1,
     "next": null,
     "offset": 5,
     "previous": "https://api.spotify.com/v1/search?query=remaster%2520track%3ADoxy%2Bartist%3AMiles%2520Davis&type=track&market=ES&locale=en-US%2Cen%3Bq%3D0.9&offset=4&limit=1",
     "total": 0
   },
   "playlists": {
     "href": "https://api.spotify.com/v1/search?query=remaster%2520track%3ADoxy%2Bartist%3AMiles%2520Davis&type=playlist&market=ES&locale=en-US%2Cen%3Bq%3D0.9&offset=5&limit=1",
     "items": [],
     "limit": 1,
     "next": null,
     "offset": 5,
     "previous": "https://api.spotify.com/v1/search?query=remaster%2520track%3ADoxy%2Bartist%3AMiles%2520Davis&type=playlist&market=ES&locale=en-US%2Cen%3Bq%3D0.9&offset=4&limit=1",
     "total": 0
   },
   "shows": {
     "href": "https://api.spotify.com/v1/search?query=remaster%2520track%3ADoxy%2Bartist%3AMiles%2520Davis&type=show&market=ES&locale=en-US%2Cen%3Bq%3D0.9&offset=5&limit=1",
     "items": [],
     "limit": 1,
     "next": null,
     "offset": 5,
     "previous": "https://api.spotify.com/v1/search?query=remaster%2520track%3ADoxy%2Bartist%3AMiles%2520Davis&type=show&market=ES&locale=en-US%2Cen%3Bq%3D0.9&offset=4&limit=1",
     "total": 0
   },
   "episodes": {
     "href": "https://api.spotify.com/v1/search?query=remaster%2520track%3ADoxy%2Bartist%3AMiles%2520Davis&type=episode&market=ES&locale=en-US%2Cen%3Bq%3D0.9&offset=5&limit=1",
     "items": [],
     "limit": 1,
     "next": null,
     "offset": 5,
     "previous": "https://api.spotify.com/v1/search?query=remaster%2520track%3ADoxy%2Bartist%3AMiles%2520Davis&type=episode&market=ES&locale=en-US%2Cen%3Bq%3D0.9&offset=4&limit=1",
     "total": 0
   }
 }
 */
