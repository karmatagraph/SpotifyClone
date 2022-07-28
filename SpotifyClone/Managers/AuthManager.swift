//
//  AuthManager.swift
//  SpotifyClone
//
//  Created by karma on 7/27/22.
//

import Foundation

final class AuthManager {
    static let shared = AuthManager()
    private init() { }
    
    public var signInUrl: URL? {
        let scopes = "user-read-private"
        let redirectUri = "https://www.instagram.com/mildcrash/"
        let base = "https://accounts.spotify.com/authorize"
        let string = "\(base)?response_type=code&client_id=\(AuthConstants.clientID)&scope=\(scopes)&redirect_uri=\(redirectUri)&show_dialog=true"
        return URL(string: string)
    }
    
    var isSignedIn: Bool {
        return false
    }
    
    private var accessToken: String? {
        return nil
    }
    private var refreshToken: String? {
        return nil
    }
    private var tokenExpirationDate: Date? {
        return nil
    }
    private var shouldRefreshToken: Bool {
        return false
    }
    
    public func exchangeCodeForToken(code: String, completion: @escaping((Bool)-> Void)) {
        // get token
        
    }
    
    public func refreshAccessToken() {
        
    }
    
    public func cacheToken() {
        
    }
    
}
