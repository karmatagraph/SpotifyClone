//
//  AlbumDetailResponse.swift
//  SpotifyClone
//
//  Created by karma on 8/3/22.
//

import Foundation

struct AlbumDetailResponse: Codable {
    let album_type: String
    let artists: [Artist]
    let external_urls: [String:String]
    let id: String
    let images: [ApiImage]
    let label: String
    let name: String
    let tracks: AudioTracksResponse
    
}

struct AudioTracksResponse: Codable {
    let items: [AudioTrack]
}

// model response
/*
 {
   "album_type": "album",
   "artists": [
     {
       "external_urls": {
         "spotify": "https://open.spotify.com/artist/0TnOYISbd1XYRBk9myaseg"
       },
       "href": "https://api.spotify.com/v1/artists/0TnOYISbd1XYRBk9myaseg",
       "id": "0TnOYISbd1XYRBk9myaseg",
       "name": "Pitbull",
       "type": "artist",
       "uri": "spotify:artist:0TnOYISbd1XYRBk9myaseg"
     }
   ]
   "genres": [],
   "href": "https://api.spotify.com/v1/albums/4aawyAB9vmqN3uQ7FjRGTy",
   "id": "4aawyAB9vmqN3uQ7FjRGTy",
   "images": [
     {
       "height": 640,
       "url": "https://i.scdn.co/image/ab67616d0000b2732c5b24ecfa39523a75c993c4",
       "width": 640
     }
   ],
   "label": "Mr.305/Polo Grounds Music/RCA Records",
   "name": "Global Warming",
   "popularity": 50,
   "release_date": "2012-11-16",
   "release_date_precision": "day",
   "total_tracks": 18,
   "tracks": {
     "href": "https://api.spotify.com/v1/albums/4aawyAB9vmqN3uQ7FjRGTy/tracks?offset=0&limit=50&market=ES&locale=en-US,en;q=0.9",
     "items": [
       {
         "artists": [
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/0TnOYISbd1XYRBk9myaseg"
             },
             "href": "https://api.spotify.com/v1/artists/0TnOYISbd1XYRBk9myaseg",
             "id": "0TnOYISbd1XYRBk9myaseg",
             "name": "Pitbull",
             "type": "artist",
             "uri": "spotify:artist:0TnOYISbd1XYRBk9myaseg"
           },
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/7iJrDbKM5fEkGdm5kpjFzS"
             },
             "href": "https://api.spotify.com/v1/artists/7iJrDbKM5fEkGdm5kpjFzS",
             "id": "7iJrDbKM5fEkGdm5kpjFzS",
             "name": "Sensato",
             "type": "artist",
             "uri": "spotify:artist:7iJrDbKM5fEkGdm5kpjFzS"
           }
         ],
         "disc_number": 1,
         "duration_ms": 85400,
         "explicit": true,
         "external_urls": {
           "spotify": "https://open.spotify.com/track/6OmhkSOpvYBokMKQxpIGx2"
         },
         "href": "https://api.spotify.com/v1/tracks/6OmhkSOpvYBokMKQxpIGx2",
         "id": "6OmhkSOpvYBokMKQxpIGx2",
         "is_local": false,
         "is_playable": true,
         "name": "Global Warming (feat. Sensato)",
         "preview_url": "https://p.scdn.co/mp3-preview/4df38b27b145e6e2d180a0790e991af3eef99d86?cid=774b29d4f13844c495f206cafdad9c86",
         "track_number": 1,
         "type": "track",
         "uri": "spotify:track:6OmhkSOpvYBokMKQxpIGx2"
       },
       {
         "artists": [
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/0TnOYISbd1XYRBk9myaseg"
             },
             "href": "https://api.spotify.com/v1/artists/0TnOYISbd1XYRBk9myaseg",
             "id": "0TnOYISbd1XYRBk9myaseg",
             "name": "Pitbull",
             "type": "artist",
             "uri": "spotify:artist:0TnOYISbd1XYRBk9myaseg"
           },
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/2L8yW8GIoirHEdeW4bWQXq"
             },
             "href": "https://api.spotify.com/v1/artists/2L8yW8GIoirHEdeW4bWQXq",
             "id": "2L8yW8GIoirHEdeW4bWQXq",
             "name": "TJR",
             "type": "artist",
             "uri": "spotify:artist:2L8yW8GIoirHEdeW4bWQXq"
           }
         ],
         "disc_number": 1,
         "duration_ms": 206120,
         "explicit": false,
         "external_urls": {
           "spotify": "https://open.spotify.com/track/2iblMMIgSznA464mNov7A8"
         },
         "href": "https://api.spotify.com/v1/tracks/2iblMMIgSznA464mNov7A8",
         "id": "2iblMMIgSznA464mNov7A8",
         "is_local": false,
         "is_playable": true,
         "name": "Don't Stop the Party (feat. TJR)",
         "preview_url": "https://p.scdn.co/mp3-preview/7e122eeb24cdb834352f8d86d21fe58dab102843?cid=774b29d4f13844c495f206cafdad9c86",
         "track_number": 2,
         "type": "track",
         "uri": "spotify:track:2iblMMIgSznA464mNov7A8"
       },
       {
         "artists": [
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/0TnOYISbd1XYRBk9myaseg"
             },
             "href": "https://api.spotify.com/v1/artists/0TnOYISbd1XYRBk9myaseg",
             "id": "0TnOYISbd1XYRBk9myaseg",
             "name": "Pitbull",
             "type": "artist",
             "uri": "spotify:artist:0TnOYISbd1XYRBk9myaseg"
           },
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/1l7ZsJRRS8wlW3WfJfPfNS"
             },
             "href": "https://api.spotify.com/v1/artists/1l7ZsJRRS8wlW3WfJfPfNS",
             "id": "1l7ZsJRRS8wlW3WfJfPfNS",
             "name": "Christina Aguilera",
             "type": "artist",
             "uri": "spotify:artist:1l7ZsJRRS8wlW3WfJfPfNS"
           }
         ],
         "disc_number": 1,
         "duration_ms": 229506,
         "explicit": false,
         "external_urls": {
           "spotify": "https://open.spotify.com/track/4yOn1TEcfsKHUJCL2h1r8I"
         },
         "href": "https://api.spotify.com/v1/tracks/4yOn1TEcfsKHUJCL2h1r8I",
         "id": "4yOn1TEcfsKHUJCL2h1r8I",
         "is_local": false,
         "is_playable": true,
         "name": "Feel This Moment (feat. Christina Aguilera)",
         "preview_url": "https://p.scdn.co/mp3-preview/efea09e24f1956b2d72dfdc81f83ba315cd7ad20?cid=774b29d4f13844c495f206cafdad9c86",
         "track_number": 3,
         "type": "track",
         "uri": "spotify:track:4yOn1TEcfsKHUJCL2h1r8I"
       },
       {
         "artists": [
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/0TnOYISbd1XYRBk9myaseg"
             },
             "href": "https://api.spotify.com/v1/artists/0TnOYISbd1XYRBk9myaseg",
             "id": "0TnOYISbd1XYRBk9myaseg",
             "name": "Pitbull",
             "type": "artist",
             "uri": "spotify:artist:0TnOYISbd1XYRBk9myaseg"
           }
         ],
         "disc_number": 1,
         "duration_ms": 207440,
         "explicit": false,
         "external_urls": {
           "spotify": "https://open.spotify.com/track/7fmpKF0rLGPnP7kcQ5ZMm7"
         },
         "href": "https://api.spotify.com/v1/tracks/7fmpKF0rLGPnP7kcQ5ZMm7",
         "id": "7fmpKF0rLGPnP7kcQ5ZMm7",
         "is_local": false,
         "is_playable": true,
         "name": "Back in Time - featured in \"Men In Black 3\"",
         "preview_url": "https://p.scdn.co/mp3-preview/2543bdfa636268244bc60842ca8eaa317d90bc09?cid=774b29d4f13844c495f206cafdad9c86",
         "track_number": 4,
         "type": "track",
         "uri": "spotify:track:7fmpKF0rLGPnP7kcQ5ZMm7"
       },
       {
         "artists": [
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/0TnOYISbd1XYRBk9myaseg"
             },
             "href": "https://api.spotify.com/v1/artists/0TnOYISbd1XYRBk9myaseg",
             "id": "0TnOYISbd1XYRBk9myaseg",
             "name": "Pitbull",
             "type": "artist",
             "uri": "spotify:artist:0TnOYISbd1XYRBk9myaseg"
           },
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/7bXgB6jMjp9ATFy66eO08Z"
             },
             "href": "https://api.spotify.com/v1/artists/7bXgB6jMjp9ATFy66eO08Z",
             "id": "7bXgB6jMjp9ATFy66eO08Z",
             "name": "Chris Brown",
             "type": "artist",
             "uri": "spotify:artist:7bXgB6jMjp9ATFy66eO08Z"
           }
         ],
         "disc_number": 1,
         "duration_ms": 221133,
         "explicit": false,
         "external_urls": {
           "spotify": "https://open.spotify.com/track/3jStb2imKd6oUoBT1zq5lp"
         },
         "href": "https://api.spotify.com/v1/tracks/3jStb2imKd6oUoBT1zq5lp",
         "id": "3jStb2imKd6oUoBT1zq5lp",
         "is_local": false,
         "is_playable": true,
         "name": "Hope We Meet Again (feat. Chris Brown)",
         "preview_url": "https://p.scdn.co/mp3-preview/53638829a2a62b1946e333d1555c827b7ac6b037?cid=774b29d4f13844c495f206cafdad9c86",
         "track_number": 5,
         "type": "track",
         "uri": "spotify:track:3jStb2imKd6oUoBT1zq5lp"
       },
       {
         "artists": [
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/0TnOYISbd1XYRBk9myaseg"
             },
             "href": "https://api.spotify.com/v1/artists/0TnOYISbd1XYRBk9myaseg",
             "id": "0TnOYISbd1XYRBk9myaseg",
             "name": "Pitbull",
             "type": "artist",
             "uri": "spotify:artist:0TnOYISbd1XYRBk9myaseg"
           },
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/23zg3TcAtWQy7J6upgbUnj"
             },
             "href": "https://api.spotify.com/v1/artists/23zg3TcAtWQy7J6upgbUnj",
             "id": "23zg3TcAtWQy7J6upgbUnj",
             "name": "Usher",
             "type": "artist",
             "uri": "spotify:artist:23zg3TcAtWQy7J6upgbUnj"
           },
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/4D75GcNG95ebPtNvoNVXhz"
             },
             "href": "https://api.spotify.com/v1/artists/4D75GcNG95ebPtNvoNVXhz",
             "id": "4D75GcNG95ebPtNvoNVXhz",
             "name": "Afrojack",
             "type": "artist",
             "uri": "spotify:artist:4D75GcNG95ebPtNvoNVXhz"
           }
         ],
         "disc_number": 1,
         "duration_ms": 243160,
         "explicit": true,
         "external_urls": {
           "spotify": "https://open.spotify.com/track/6Q4PYJtrq8CBx7YCY5IyRN"
         },
         "href": "https://api.spotify.com/v1/tracks/6Q4PYJtrq8CBx7YCY5IyRN",
         "id": "6Q4PYJtrq8CBx7YCY5IyRN",
         "is_local": false,
         "is_playable": true,
         "name": "Party Ain't Over (feat. Usher & Afrojack)",
         "preview_url": "https://p.scdn.co/mp3-preview/90706e558acf88c0af1a63024686c7cd1f834271?cid=774b29d4f13844c495f206cafdad9c86",
         "track_number": 6,
         "type": "track",
         "uri": "spotify:track:6Q4PYJtrq8CBx7YCY5IyRN"
       },
       {
         "artists": [
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/0TnOYISbd1XYRBk9myaseg"
             },
             "href": "https://api.spotify.com/v1/artists/0TnOYISbd1XYRBk9myaseg",
             "id": "0TnOYISbd1XYRBk9myaseg",
             "name": "Pitbull",
             "type": "artist",
             "uri": "spotify:artist:0TnOYISbd1XYRBk9myaseg"
           },
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/2DlGxzQSjYe5N6G9nkYghR"
             },
             "href": "https://api.spotify.com/v1/artists/2DlGxzQSjYe5N6G9nkYghR",
             "id": "2DlGxzQSjYe5N6G9nkYghR",
             "name": "Jennifer Lopez",
             "type": "artist",
             "uri": "spotify:artist:2DlGxzQSjYe5N6G9nkYghR"
           }
         ],
         "disc_number": 1,
         "duration_ms": 196920,
         "explicit": false,
         "external_urls": {
           "spotify": "https://open.spotify.com/track/0QTVwqcOsYd73AOkYkk0Hg"
         },
         "href": "https://api.spotify.com/v1/tracks/0QTVwqcOsYd73AOkYkk0Hg",
         "id": "0QTVwqcOsYd73AOkYkk0Hg",
         "is_local": false,
         "is_playable": true,
         "name": "Drinks for You (Ladies Anthem) (feat. J. Lo)",
         "preview_url": "https://p.scdn.co/mp3-preview/240def76ff5a5bb2a6c5b42f7224f3f0efde6e23?cid=774b29d4f13844c495f206cafdad9c86",
         "track_number": 7,
         "type": "track",
         "uri": "spotify:track:0QTVwqcOsYd73AOkYkk0Hg"
       },
       {
         "artists": [
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/0TnOYISbd1XYRBk9myaseg"
             },
             "href": "https://api.spotify.com/v1/artists/0TnOYISbd1XYRBk9myaseg",
             "id": "0TnOYISbd1XYRBk9myaseg",
             "name": "Pitbull",
             "type": "artist",
             "uri": "spotify:artist:0TnOYISbd1XYRBk9myaseg"
           },
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/0rdrTj1p6n1C9KnwaWn6xf"
             },
             "href": "https://api.spotify.com/v1/artists/0rdrTj1p6n1C9KnwaWn6xf",
             "id": "0rdrTj1p6n1C9KnwaWn6xf",
             "name": "The Wanted",
             "type": "artist",
             "uri": "spotify:artist:0rdrTj1p6n1C9KnwaWn6xf"
           },
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/4D75GcNG95ebPtNvoNVXhz"
             },
             "href": "https://api.spotify.com/v1/artists/4D75GcNG95ebPtNvoNVXhz",
             "id": "4D75GcNG95ebPtNvoNVXhz",
             "name": "Afrojack",
             "type": "artist",
             "uri": "spotify:artist:4D75GcNG95ebPtNvoNVXhz"
           }
         ],
         "disc_number": 1,
         "duration_ms": 244920,
         "explicit": false,
         "external_urls": {
           "spotify": "https://open.spotify.com/track/10Sydb6AAFPdgCzCKOSZuI"
         },
         "href": "https://api.spotify.com/v1/tracks/10Sydb6AAFPdgCzCKOSZuI",
         "id": "10Sydb6AAFPdgCzCKOSZuI",
         "is_local": false,
         "is_playable": true,
         "name": "Have Some Fun (feat. The Wanted & Afrojack)",
         "preview_url": "https://p.scdn.co/mp3-preview/30e6d8e2700d2affc2f949998dd8f6a8488ce3a3?cid=774b29d4f13844c495f206cafdad9c86",
         "track_number": 8,
         "type": "track",
         "uri": "spotify:track:10Sydb6AAFPdgCzCKOSZuI"
       },
       {
         "artists": [
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/0TnOYISbd1XYRBk9myaseg"
             },
             "href": "https://api.spotify.com/v1/artists/0TnOYISbd1XYRBk9myaseg",
             "id": "0TnOYISbd1XYRBk9myaseg",
             "name": "Pitbull",
             "type": "artist",
             "uri": "spotify:artist:0TnOYISbd1XYRBk9myaseg"
           },
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/0e9P96siQmxphVXAwTy2pa"
             },
             "href": "https://api.spotify.com/v1/artists/0e9P96siQmxphVXAwTy2pa",
             "id": "0e9P96siQmxphVXAwTy2pa",
             "name": "Danny Mercer",
             "type": "artist",
             "uri": "spotify:artist:0e9P96siQmxphVXAwTy2pa"
           }
         ],
         "disc_number": 1,
         "duration_ms": 206800,
         "explicit": true,
         "external_urls": {
           "spotify": "https://open.spotify.com/track/4k61iDqmtX9nI7RfLmp9aq"
         },
         "href": "https://api.spotify.com/v1/tracks/4k61iDqmtX9nI7RfLmp9aq",
         "id": "4k61iDqmtX9nI7RfLmp9aq",
         "is_local": false,
         "is_playable": true,
         "name": "Outta Nowhere (feat. Danny Mercer)",
         "preview_url": "https://p.scdn.co/mp3-preview/b2835f00969a0de2dd89fec204328761b44159fb?cid=774b29d4f13844c495f206cafdad9c86",
         "track_number": 9,
         "type": "track",
         "uri": "spotify:track:4k61iDqmtX9nI7RfLmp9aq"
       },
       {
         "artists": [
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/0TnOYISbd1XYRBk9myaseg"
             },
             "href": "https://api.spotify.com/v1/artists/0TnOYISbd1XYRBk9myaseg",
             "id": "0TnOYISbd1XYRBk9myaseg",
             "name": "Pitbull",
             "type": "artist",
             "uri": "spotify:artist:0TnOYISbd1XYRBk9myaseg"
           },
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/7qG3b048QCHVRO5Pv1T5lw"
             },
             "href": "https://api.spotify.com/v1/artists/7qG3b048QCHVRO5Pv1T5lw",
             "id": "7qG3b048QCHVRO5Pv1T5lw",
             "name": "Enrique Iglesias",
             "type": "artist",
             "uri": "spotify:artist:7qG3b048QCHVRO5Pv1T5lw"
           }
         ],
         "disc_number": 1,
         "duration_ms": 205800,
         "explicit": false,
         "external_urls": {
           "spotify": "https://open.spotify.com/track/7oGRkL31ElVMcevQDceT99"
         },
         "href": "https://api.spotify.com/v1/tracks/7oGRkL31ElVMcevQDceT99",
         "id": "7oGRkL31ElVMcevQDceT99",
         "is_local": false,
         "is_playable": true,
         "name": "Tchu Tchu Tcha (feat. Enrique Iglesias)",
         "preview_url": "https://p.scdn.co/mp3-preview/558ca284c78b71227fce159b3e35e60110c2210a?cid=774b29d4f13844c495f206cafdad9c86",
         "track_number": 10,
         "type": "track",
         "uri": "spotify:track:7oGRkL31ElVMcevQDceT99"
       },
       {
         "artists": [
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/0TnOYISbd1XYRBk9myaseg"
             },
             "href": "https://api.spotify.com/v1/artists/0TnOYISbd1XYRBk9myaseg",
             "id": "0TnOYISbd1XYRBk9myaseg",
             "name": "Pitbull",
             "type": "artist",
             "uri": "spotify:artist:0TnOYISbd1XYRBk9myaseg"
           },
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/4D75GcNG95ebPtNvoNVXhz"
             },
             "href": "https://api.spotify.com/v1/artists/4D75GcNG95ebPtNvoNVXhz",
             "id": "4D75GcNG95ebPtNvoNVXhz",
             "name": "Afrojack",
             "type": "artist",
             "uri": "spotify:artist:4D75GcNG95ebPtNvoNVXhz"
           },
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/1EVWYRr2obCRDoSoD6KSuM"
             },
             "href": "https://api.spotify.com/v1/artists/1EVWYRr2obCRDoSoD6KSuM",
             "id": "1EVWYRr2obCRDoSoD6KSuM",
             "name": "Havana Brown",
             "type": "artist",
             "uri": "spotify:artist:1EVWYRr2obCRDoSoD6KSuM"
           }
         ],
         "disc_number": 1,
         "duration_ms": 219600,
         "explicit": true,
         "external_urls": {
           "spotify": "https://open.spotify.com/track/60xPqMqnHZl7Jfiu6E9q8X"
         },
         "href": "https://api.spotify.com/v1/tracks/60xPqMqnHZl7Jfiu6E9q8X",
         "id": "60xPqMqnHZl7Jfiu6E9q8X",
         "is_local": false,
         "is_playable": true,
         "name": "Last Night (feat. Afrojack & Havana Brown)",
         "preview_url": "https://p.scdn.co/mp3-preview/364b94d0e4184afff5303a9fee4ce870bca276bf?cid=774b29d4f13844c495f206cafdad9c86",
         "track_number": 11,
         "type": "track",
         "uri": "spotify:track:60xPqMqnHZl7Jfiu6E9q8X"
       },
       {
         "artists": [
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/0TnOYISbd1XYRBk9myaseg"
             },
             "href": "https://api.spotify.com/v1/artists/0TnOYISbd1XYRBk9myaseg",
             "id": "0TnOYISbd1XYRBk9myaseg",
             "name": "Pitbull",
             "type": "artist",
             "uri": "spotify:artist:0TnOYISbd1XYRBk9myaseg"
           }
         ],
         "disc_number": 1,
         "duration_ms": 197520,
         "explicit": true,
         "external_urls": {
           "spotify": "https://open.spotify.com/track/1jAdXqOSICyXYLaW9ioSur"
         },
         "href": "https://api.spotify.com/v1/tracks/1jAdXqOSICyXYLaW9ioSur",
         "id": "1jAdXqOSICyXYLaW9ioSur",
         "is_local": false,
         "is_playable": true,
         "name": "I'm Off That",
         "preview_url": "https://p.scdn.co/mp3-preview/edf634408f6b6dd3314745809711d553f4190879?cid=774b29d4f13844c495f206cafdad9c86",
         "track_number": 12,
         "type": "track",
         "uri": "spotify:track:1jAdXqOSICyXYLaW9ioSur"
       },
       {
         "artists": [
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/0TnOYISbd1XYRBk9myaseg"
             },
             "href": "https://api.spotify.com/v1/artists/0TnOYISbd1XYRBk9myaseg",
             "id": "0TnOYISbd1XYRBk9myaseg",
             "name": "Pitbull",
             "type": "artist",
             "uri": "spotify:artist:0TnOYISbd1XYRBk9myaseg"
           },
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/5F2Bwl7Is7KVwTbNbMclIS"
             },
             "href": "https://api.spotify.com/v1/artists/5F2Bwl7Is7KVwTbNbMclIS",
             "id": "5F2Bwl7Is7KVwTbNbMclIS",
             "name": "Papayo",
             "type": "artist",
             "uri": "spotify:artist:5F2Bwl7Is7KVwTbNbMclIS"
           }
         ],
         "disc_number": 1,
         "duration_ms": 196440,
         "explicit": false,
         "external_urls": {
           "spotify": "https://open.spotify.com/track/0fjRYHFz9ealui1lfnN8it"
         },
         "href": "https://api.spotify.com/v1/tracks/0fjRYHFz9ealui1lfnN8it",
         "id": "0fjRYHFz9ealui1lfnN8it",
         "is_local": false,
         "is_playable": true,
         "name": "Echa Pa'lla (Manos Pa'rriba) (feat. Papayo)",
         "preview_url": "https://p.scdn.co/mp3-preview/b4fb0332535392791e64d29c0e360b852d1f765d?cid=774b29d4f13844c495f206cafdad9c86",
         "track_number": 13,
         "type": "track",
         "uri": "spotify:track:0fjRYHFz9ealui1lfnN8it"
       },
       {
         "artists": [
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/0TnOYISbd1XYRBk9myaseg"
             },
             "href": "https://api.spotify.com/v1/artists/0TnOYISbd1XYRBk9myaseg",
             "id": "0TnOYISbd1XYRBk9myaseg",
             "name": "Pitbull",
             "type": "artist",
             "uri": "spotify:artist:0TnOYISbd1XYRBk9myaseg"
           },
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/0z4gvV4rjIZ9wHck67ucSV"
             },
             "href": "https://api.spotify.com/v1/artists/0z4gvV4rjIZ9wHck67ucSV",
             "id": "0z4gvV4rjIZ9wHck67ucSV",
             "name": "Akon",
             "type": "artist",
             "uri": "spotify:artist:0z4gvV4rjIZ9wHck67ucSV"
           },
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/5IqWDVLGThjmkm22e3oBU3"
             },
             "href": "https://api.spotify.com/v1/artists/5IqWDVLGThjmkm22e3oBU3",
             "id": "5IqWDVLGThjmkm22e3oBU3",
             "name": "David Rush",
             "type": "artist",
             "uri": "spotify:artist:5IqWDVLGThjmkm22e3oBU3"
           }
         ],
         "disc_number": 1,
         "duration_ms": 257613,
         "explicit": true,
         "external_urls": {
           "spotify": "https://open.spotify.com/track/7of35ktwTbL906Z1i3mT4K"
         },
         "href": "https://api.spotify.com/v1/tracks/7of35ktwTbL906Z1i3mT4K",
         "id": "7of35ktwTbL906Z1i3mT4K",
         "is_local": false,
         "is_playable": true,
         "name": "Everybody Fucks (feat. Akon & David Rush)",
         "preview_url": "https://p.scdn.co/mp3-preview/be4c8a329a03955472fb4e5747da28cbb8b964b9?cid=774b29d4f13844c495f206cafdad9c86",
         "track_number": 14,
         "type": "track",
         "uri": "spotify:track:7of35ktwTbL906Z1i3mT4K"
       },
       {
         "artists": [
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/0TnOYISbd1XYRBk9myaseg"
             },
             "href": "https://api.spotify.com/v1/artists/0TnOYISbd1XYRBk9myaseg",
             "id": "0TnOYISbd1XYRBk9myaseg",
             "name": "Pitbull",
             "type": "artist",
             "uri": "spotify:artist:0TnOYISbd1XYRBk9myaseg"
           },
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/0EmeFodog0BfCgMzAIvKQp"
             },
             "href": "https://api.spotify.com/v1/artists/0EmeFodog0BfCgMzAIvKQp",
             "id": "0EmeFodog0BfCgMzAIvKQp",
             "name": "Shakira",
             "type": "artist",
             "uri": "spotify:artist:0EmeFodog0BfCgMzAIvKQp"
           }
         ],
         "disc_number": 1,
         "duration_ms": 245920,
         "explicit": false,
         "external_urls": {
           "spotify": "https://open.spotify.com/track/2JA6A6Y5f4m7PawM58U2Op"
         },
         "href": "https://api.spotify.com/v1/tracks/2JA6A6Y5f4m7PawM58U2Op",
         "id": "2JA6A6Y5f4m7PawM58U2Op",
         "is_local": false,
         "is_playable": true,
         "name": "Get It Started (feat. Shakira)",
         "preview_url": "https://p.scdn.co/mp3-preview/e2513ea717b9cac6d504c98747bc417ee6c96d2f?cid=774b29d4f13844c495f206cafdad9c86",
         "track_number": 15,
         "type": "track",
         "uri": "spotify:track:2JA6A6Y5f4m7PawM58U2Op"
       },
       {
         "artists": [
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/0TnOYISbd1XYRBk9myaseg"
             },
             "href": "https://api.spotify.com/v1/artists/0TnOYISbd1XYRBk9myaseg",
             "id": "0TnOYISbd1XYRBk9myaseg",
             "name": "Pitbull",
             "type": "artist",
             "uri": "spotify:artist:0TnOYISbd1XYRBk9myaseg"
           },
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/3BnF35ARlp8mMeyXTjUZsr"
             },
             "href": "https://api.spotify.com/v1/artists/3BnF35ARlp8mMeyXTjUZsr",
             "id": "3BnF35ARlp8mMeyXTjUZsr",
             "name": "Vein",
             "type": "artist",
             "uri": "spotify:artist:3BnF35ARlp8mMeyXTjUZsr"
           }
         ],
         "disc_number": 1,
         "duration_ms": 217680,
         "explicit": true,
         "external_urls": {
           "spotify": "https://open.spotify.com/track/726qZxwhP0jVyIA0ujnnhb"
         },
         "href": "https://api.spotify.com/v1/tracks/726qZxwhP0jVyIA0ujnnhb",
         "id": "726qZxwhP0jVyIA0ujnnhb",
         "is_local": false,
         "is_playable": true,
         "name": "11:59 (feat. Vein)",
         "preview_url": "https://p.scdn.co/mp3-preview/081cb91f53b76b191517db76d587f4541619b381?cid=774b29d4f13844c495f206cafdad9c86",
         "track_number": 16,
         "type": "track",
         "uri": "spotify:track:726qZxwhP0jVyIA0ujnnhb"
       },
       {
         "artists": [
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/0TnOYISbd1XYRBk9myaseg"
             },
             "href": "https://api.spotify.com/v1/artists/0TnOYISbd1XYRBk9myaseg",
             "id": "0TnOYISbd1XYRBk9myaseg",
             "name": "Pitbull",
             "type": "artist",
             "uri": "spotify:artist:0TnOYISbd1XYRBk9myaseg"
           },
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/4wLXwxDeWQ8mtUIRPxGiD6"
             },
             "href": "https://api.spotify.com/v1/artists/4wLXwxDeWQ8mtUIRPxGiD6",
             "id": "4wLXwxDeWQ8mtUIRPxGiD6",
             "name": "Marc Anthony",
             "type": "artist",
             "uri": "spotify:artist:4wLXwxDeWQ8mtUIRPxGiD6"
           },
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/4MHssKddnziCghmwBHRiEY"
             },
             "href": "https://api.spotify.com/v1/artists/4MHssKddnziCghmwBHRiEY",
             "id": "4MHssKddnziCghmwBHRiEY",
             "name": "Alle",
             "type": "artist",
             "uri": "spotify:artist:4MHssKddnziCghmwBHRiEY"
           },
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/4Ws2otunReOa6BbwxxpCt6"
             },
             "href": "https://api.spotify.com/v1/artists/4Ws2otunReOa6BbwxxpCt6",
             "id": "4Ws2otunReOa6BbwxxpCt6",
             "name": "Benny Benassi",
             "type": "artist",
             "uri": "spotify:artist:4Ws2otunReOa6BbwxxpCt6"
           }
         ],
         "disc_number": 1,
         "duration_ms": 316480,
         "explicit": false,
         "external_urls": {
           "spotify": "https://open.spotify.com/track/6GPER1Sx8MrBiwWxdulg5Q"
         },
         "href": "https://api.spotify.com/v1/tracks/6GPER1Sx8MrBiwWxdulg5Q",
         "id": "6GPER1Sx8MrBiwWxdulg5Q",
         "is_local": false,
         "is_playable": true,
         "name": "Rain Over Me (feat. Marc Anthony) - Benny Benassi Remix",
         "preview_url": "https://p.scdn.co/mp3-preview/90c13e474656440586ba8095112e804a9bac7137?cid=774b29d4f13844c495f206cafdad9c86",
         "track_number": 17,
         "type": "track",
         "uri": "spotify:track:6GPER1Sx8MrBiwWxdulg5Q"
       },
       {
         "artists": [
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/0TnOYISbd1XYRBk9myaseg"
             },
             "href": "https://api.spotify.com/v1/artists/0TnOYISbd1XYRBk9myaseg",
             "id": "0TnOYISbd1XYRBk9myaseg",
             "name": "Pitbull",
             "type": "artist",
             "uri": "spotify:artist:0TnOYISbd1XYRBk9myaseg"
           },
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/7bXgB6jMjp9ATFy66eO08Z"
             },
             "href": "https://api.spotify.com/v1/artists/7bXgB6jMjp9ATFy66eO08Z",
             "id": "7bXgB6jMjp9ATFy66eO08Z",
             "name": "Chris Brown",
             "type": "artist",
             "uri": "spotify:artist:7bXgB6jMjp9ATFy66eO08Z"
           },
           {
             "external_urls": {
               "spotify": "https://open.spotify.com/artist/5I7l0lSOyusetwCv1aQPMf"
             },
             "href": "https://api.spotify.com/v1/artists/5I7l0lSOyusetwCv1aQPMf",
             "id": "5I7l0lSOyusetwCv1aQPMf",
             "name": "Jump Smokers",
             "type": "artist",
             "uri": "spotify:artist:5I7l0lSOyusetwCv1aQPMf"
           }
         ],
         "disc_number": 1,
         "duration_ms": 309626,
         "explicit": false,
         "external_urls": {
           "spotify": "https://open.spotify.com/track/4TWgcICXXfGty8MHGWJ4Ne"
         },
         "href": "https://api.spotify.com/v1/tracks/4TWgcICXXfGty8MHGWJ4Ne",
         "id": "4TWgcICXXfGty8MHGWJ4Ne",
         "is_local": false,
         "is_playable": true,
         "name": "International Love (feat. Chris Brown) - Jump Smokers Extended Mix",
         "preview_url": "https://p.scdn.co/mp3-preview/bc27ca449846757eafb4247228018a6b6c5b31af?cid=774b29d4f13844c495f206cafdad9c86",
         "track_number": 18,
         "type": "track",
         "uri": "spotify:track:4TWgcICXXfGty8MHGWJ4Ne"
       }
     ],
     "limit": 50,
     "next": null,
     "offset": 0,
     "previous": null,
     "total": 18
   },
   "type": "album",
   "uri": "spotify:album:4aawyAB9vmqN3uQ7FjRGTy"
 }
 */
