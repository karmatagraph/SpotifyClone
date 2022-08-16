//
//  LibraryAlbumsResponse.swift
//  SpotifyClone
//
//  Created by karma on 8/15/22.
//

import Foundation

struct LibraryAlbumResponse: Codable {
    let items: [LibraryAlbumDetailResponse]
}

struct LibraryAlbumDetailResponse: Codable {
    let album: Album?
}

//{
//    href = "https://api.spotify.com/v1/me/albums?offset=0&limit=20&locale=en-US,en;q=0.9";
//    items =     (
//                {
//            "added_at" = "2022-08-15T09:08:43Z";
//            album =             {
//                "album_type" = single;
//                artists =                 (
//                                        {
//                        "external_urls" =                         {
//                            spotify = "https://open.spotify.com/artist/3aQeKQSyrW4qWr35idm0cy";
//                        };
//                        href = "https://api.spotify.com/v1/artists/3aQeKQSyrW4qWr35idm0cy";
//                        id = 3aQeKQSyrW4qWr35idm0cy;
//                        name = "T-Pain";
//                        type = artist;
//                        uri = "spotify:artist:3aQeKQSyrW4qWr35idm0cy";
//                    }
//                );
//                "available_markets" =                 (
//                    AD
//                );
//                copyrights =                 (
//                                        {
//                        text = "2021 Nappy Boy Entertainment / EMPIRE";
//                        type = C;
//                    },
//                                        {
//                        text = "2021 Nappy Boy Entertainment / EMPIRE";
//                        type = P;
//                    }
//                );
//                "external_ids" =                 {
//                    upc = 194690708008;
//                };
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/album/2AlepdOP7k17Gtuw9rqh5R";
//                };
//                genres =                 (
//                );
//                href = "https://api.spotify.com/v1/albums/2AlepdOP7k17Gtuw9rqh5R";
//                id = 2AlepdOP7k17Gtuw9rqh5R;
//                images =                 (
//                                        {
//                        height = 640;
//                        url = "https://i.scdn.co/image/ab67616d0000b2738002fc38a4dce42c2771a029";
//                        width = 640;
//                    },
//                                        {
//                        height = 300;
//                        url = "https://i.scdn.co/image/ab67616d00001e028002fc38a4dce42c2771a029";
//                        width = 300;
//                    },
//                                        {
//                        height = 64;
//                        url = "https://i.scdn.co/image/ab67616d000048518002fc38a4dce42c2771a029";
//                        width = 64;
//                    }
//                );
//                label = "Nappy Boy Entertainment / EMPIRE";
//                name = "Shootin' Up The Club";
//                popularity = 34;
//                "release_date" = "2021-11-29";
//                "release_date_precision" = day;
//                "total_tracks" = 1;
//                tracks =                 {
//                    href = "https://api.spotify.com/v1/albums/2AlepdOP7k17Gtuw9rqh5R/tracks?offset=0&limit=50&locale=en-US,en;q=0.9";
//                    items =                     (
//                                                {
//                            artists =                             (
//                                                                {
//                                    "external_urls" =                                     {
//                                        spotify = "https://open.spotify.com/artist/3aQeKQSyrW4qWr35idm0cy";
//                                    };
//                                    href = "https://api.spotify.com/v1/artists/3aQeKQSyrW4qWr35idm0cy";
//                                    id = 3aQeKQSyrW4qWr35idm0cy;
//                                    name = "T-Pain";
//                                    type = artist;
//                                    uri = "spotify:artist:3aQeKQSyrW4qWr35idm0cy";
//                                }
//                            );
//                            "available_markets" =                             (
//                                ZW
//                            );
//                            "disc_number" = 1;
//                            "duration_ms" = 166852;
//                            explicit = 1;
//                            "external_urls" =                             {
//                                spotify = "https://open.spotify.com/track/3vuRYeE3ZV3FbwH6FwgaxJ";
//                            };
//                            href = "https://api.spotify.com/v1/tracks/3vuRYeE3ZV3FbwH6FwgaxJ";
//                            id = 3vuRYeE3ZV3FbwH6FwgaxJ;
//                            "is_local" = 0;
//                            name = "Shootin' Up The Club";
//                            "preview_url" = "https://p.scdn.co/mp3-preview/4614e0f05915e2dcfbeb1d04655f3ab59bd982a4?cid=904ea6df4d004948be15164186069498";
//                            "track_number" = 1;
//                            type = track;
//                            uri = "spotify:track:3vuRYeE3ZV3FbwH6FwgaxJ";
//                        }
//                    );
//                    limit = 50;
//                    next = "<null>";
//                    offset = 0;
//                    previous = "<null>";
//                    total = 1;
//                };
//                type = album;
//                uri = "spotify:album:2AlepdOP7k17Gtuw9rqh5R";
//            };
//        }
//    );
//    limit = 20;
//    next = "<null>";
//    offset = 0;
//    previous = "<null>";
//    total = 1;
//}
