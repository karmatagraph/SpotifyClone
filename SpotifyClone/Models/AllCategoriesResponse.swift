//
//  AllCategoriesResponse.swift
//  SpotifyClone
//
//  Created by karma on 8/5/22.
//

import Foundation

struct AllCategoriesResponse: Codable {
    let categories: Categories
}

struct Categories: Codable {
    let items: [Category]
}

struct Category: Codable {
    let id: String
    let name: String
    let icons: [ApiImage]
    
}

/*
 {
   "categories": {
     "href": "https://api.spotify.com/v1/browse/categories?country=SE&locale=sv_se&offset=5&limit=1",
     "items": [
       {
         "href": "https://api.spotify.com/v1/browse/categories/0JQ5DAqbMKFPw634sFwguI",
         "icons": [
           {
             "height": null,
             "url": "https://t.scdn.co/images/084155aeaa724ea1bd393a017d67b709",
             "width": null
           }
         ],
         "id": "0JQ5DAqbMKFPw634sFwguI",
         "name": "EQUAL"
       }
     ],
     "limit": 1,
     "next": "https://api.spotify.com/v1/browse/categories?country=SE&locale=sv_se&offset=6&limit=1",
     "offset": 5,
     "previous": "https://api.spotify.com/v1/browse/categories?country=SE&locale=sv_se&offset=4&limit=1",
     "total": 46
   }
 }
 */
