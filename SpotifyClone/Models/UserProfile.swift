//
//  UserProfile.swift
//  SpotifyClone
//
//  Created by karma on 7/27/22.
//

import Foundation

// user profile response
/*
 {
   "country": "string",
   "display_name": "string",
   "email": "string",
   "explicit_content": {
     "filter_enabled": true,
     "filter_locked": true
   },
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
   "product": "string",
   "type": "string",
   "uri": "string"
 }
 */

struct UserProfile: Codable {
    let country: String
    let displayName: String
    let email: String
    let explicitContent: [String:Bool]
    let externalUrls: [String:String]
//    let followers: [String: Codable?]
    let id: String
    let images: [UserImage]
    let product: String
    
    enum CodingKeys: String,CodingKey {
        case country, email, id, images, product
        case displayName = "display_name"
        case explicitContent = "explicit_content"
        case externalUrls = "external_urls"
    }
}

struct UserImage: Codable {
    let url: String
}
