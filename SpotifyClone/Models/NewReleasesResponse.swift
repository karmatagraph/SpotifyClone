//
//  NewReleasesResponse.swift
//  SpotifyClone
//
//  Created by karma on 7/29/22.
//

import Foundation

/*
 {
     albums =     {
         href = "https://api.spotify.com/v1/browse/new-releases?locale=en-US%2Cen%3Bq%3D0.9&offset=0&limit=1";
         items =         (
                         {
                 "album_type" = album;
                 artists =                 (
                                         {
                         "external_urls" =                         {
                             spotify = "https://open.spotify.com/artist/6vWDO969PvNqNYHIOW5v0m";
                         };
                         href = "https://api.spotify.com/v1/artists/6vWDO969PvNqNYHIOW5v0m";
                         id = 6vWDO969PvNqNYHIOW5v0m;
                         name = "Beyonc\U00e9";
                         type = artist;
                         uri = "spotify:artist:6vWDO969PvNqNYHIOW5v0m";
                     }
                 );
                 "available_markets" =                 (
                     TO,
                     NI,
                     SV
                 );
                 "external_urls" =                 {
                     spotify = "https://open.spotify.com/album/6FJxoadUE4JNVwWHghBwnb";
                 };
                 href = "https://api.spotify.com/v1/albums/6FJxoadUE4JNVwWHghBwnb";
                 id = 6FJxoadUE4JNVwWHghBwnb;
                 images =                 (
                                         {
                         height = 640;
                         url = "https://i.scdn.co/image/ab67616d0000b2730e58a0f8308c1ad403d105e7";
                         width = 640;
                     },
                 );
                 name = RENAISSANCE;
                 "release_date" = "2022-07-29";
                 "release_date_precision" = day;
                 "total_tracks" = 16;
                 type = album;
                 uri = "spotify:album:6FJxoadUE4JNVwWHghBwnb";
             }
         );
         limit = 1;
         next = "https://api.spotify.com/v1/browse/new-releases?locale=en-US%2Cen%3Bq%3D0.9&offset=1&limit=1";
         offset = 0;
         previous = "<null>";
         total = 100;
     };
 }

 */

struct NewReleasesResponse: Codable {
    let albums: AlbumResponse
}

struct AlbumResponse: Codable {
    let items: [Album]
}

struct Album: Codable {
    let album_type: String?
    let available_markets: [String]?
    let id: String?
    var images: [ApiImage]
    let name: String
    let release_date: String
    let total_tracks: Int
    let artists: [Artist]
}
