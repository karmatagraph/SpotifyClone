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
        let scopes = "user-read-private%20playlist-modify-public%20playlist-read-private%20user-library-modify%20user-library-read%20user-read-email"
        let redirectUri = "https://www.instagram.com/mildcrash/"
        let base = "https://accounts.spotify.com/authorize"
        let string = "\(base)?response_type=code&client_id=\(AuthConstants.clientID)&scope=\(scopes)&redirect_uri=\(redirectUri)&show_dialog=true"
        return URL(string: string)
    }
    
    var isSignedIn: Bool {
        return accessToken != nil
    }
    
    private var accessToken: String? {
        return UserDefaults.standard.string(forKey: UserDefaultsKeys.accessToken)
    }
    private var refreshToken: String? {
        return UserDefaults.standard.string(forKey: UserDefaultsKeys.refreshToken)
    }
    private var tokenExpirationDate: Date? {
        return UserDefaults.standard.object(forKey: UserDefaultsKeys.expirationDate) as? Date
    }
    private var shouldRefreshToken: Bool {
        guard let tokenExpirationDate = tokenExpirationDate else {
            return false
        }
        let currentDate = Date()
        let fiveMinutes:TimeInterval = 300
        return currentDate.addingTimeInterval(fiveMinutes) >= tokenExpirationDate
        
        return false
    }
    
    public func exchangeCodeForToken(code: String, completion: @escaping((Bool)-> Void)) {
        // get token
        guard let url = URL(string: Endpoints.tokenApiUrl) else {
            return
        }
        var components = URLComponents()
        components.queryItems = [
            URLQueryItem(name: "grant_type",
                         value: "authorization_code"),
            URLQueryItem(name: "code",
                         value: code),
            URLQueryItem(name: "redirect_uri",
                         value: "https://www.instagram.com/mildcrash/")
            
        ]
        
        let basicToken = AuthConstants.clientID + ":" + AuthConstants.clientSecret
        let data = basicToken.data(using: .utf8)
        guard let base64String = data?.base64EncodedString() else {
            print("somthing went wrong to get base 64 ")
            completion(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Basic \(base64String)", forHTTPHeaderField: "Authorization")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = components.query?.data(using: .utf8)

        
    
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data,error == nil else {
                completion(false)
                return
            }
            do {
                let result = try JSONDecoder().decode(AuthResponse.self, from: data)
                print("SUCCESS: ---\(result)")
                completion(true)
            } catch let error {
                print(error.localizedDescription)
                completion(false)
            }
        }
        task.resume()
    }
    
    public func refreshIfNeeded(completion: @escaping((Bool)-> Void)) {
//        guard shouldRefreshToken else {
//            completion(true)
//            return
//        }
        guard let refreshToken = refreshToken else {
            return
        }
        
        //get token
        guard let url = URL(string: Endpoints.tokenApiUrl) else {
            return
        }
        var components = URLComponents()
        let refreshTokenFromUserd = UserDefaults.standard.string(forKey: UserDefaultsKeys.refreshToken)
        components.queryItems = [
            URLQueryItem(name: "grant_type",
                         value: "refresh_token"),
            URLQueryItem(name: "refresh_token",
                         value: refreshTokenFromUserd)
            
        ]
        
        let basicToken = AuthConstants.clientID + ":" + AuthConstants.clientSecret
        let data = basicToken.data(using: .utf8)
        guard let base64String = data?.base64EncodedString() else {
            print("somthing went wrong to get base 64 ")
            completion(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Basic \(base64String)", forHTTPHeaderField: "Authorization")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = components.query?.data(using: .utf8)

        
    
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data,error == nil else {
                completion(false)
                return
            }
            do {
                let result = try JSONDecoder().decode(AuthResponse.self, from: data)
                print("Successful refreshing the token")
                completion(true)
            } catch let error {
                print(error.localizedDescription)
                completion(false)
            }
        }
        task.resume()
    }
    
    public func cacheToken(result: AuthResponse) {
        UserDefaults.standard.set(result.accessToken, forKey: UserDefaultsKeys.accessToken)
        if let refreshToken = result.refreshToken {
            UserDefaults.standard.set(refreshToken, forKey: UserDefaultsKeys.refreshToken)
        }
        UserDefaults.standard.set(Date().addingTimeInterval(TimeInterval(result.expiresIn)), forKey: UserDefaultsKeys.expirationDate)
    }
    
}
