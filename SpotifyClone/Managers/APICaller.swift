//
//  APICaller.swift
//  SpotifyClone
//
//  Created by karma on 7/27/22.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    private init() {}
    
    public func getCurrentUserProfile(completion: @escaping((Result<UserProfile,Error>)-> Void)) {
        createRequest(with: Endpoints.profile.url, type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data,error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(UserProfile.self, from: data)
                    print(result)
                } catch let error {
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    // MARK: - Private method
    
    private func createRequest(with url: URL?,
                               type: HTTPMethod,
                               completion: @escaping(URLRequest) -> Void) {
        AuthManager.shared.withValidToken { token in
            guard let apiUrl = url else {
                return
            }
            var request = URLRequest(url: apiUrl)
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.httpMethod = type.rawValue
            request.timeoutInterval = 30
            completion(request)
        }
    }
    
}
