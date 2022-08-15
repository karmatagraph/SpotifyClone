//
//  APICaller.swift
//  SpotifyClone
//
//  Created by karma on 7/27/22.
//

import Foundation
import UIKit

final class APICaller {
    static let shared = APICaller()
    private init() {}
    
    // MARK: - Albums
    
    public func getAlbumDetails(for album: Album, completion: @escaping((Result<AlbumDetailResponse,Error>)->Void)) {
        createRequest(with: Endpoints.album(id: album.id).url,
                      type: .GET) { baseRequest in
            let task = URLSession.shared.dataTask(with: baseRequest) { data, _, error in
                guard
                    let data = data,
                    error == nil else {
                    return
                }
                do {
                    let model = try JSONDecoder().decode(AlbumDetailResponse.self, from: data)//JSONSerialization.jsonObject(with: data)
                    print(model)
                    completion(.success(model))
                } catch let error {
                    print(error)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    // MARK: - Playlist
    public func getPlaylistDetails(for playlist: Playlist, completion: @escaping((Result<PlaylistDetailResponse,Error>)->Void)) {
        createRequest(with: Endpoints.playlist(id: playlist.id).url,
                      type: .GET) { baseRequest in
            let task = URLSession.shared.dataTask(with: baseRequest) { data, _, error in
                guard
                    let data = data,
                    error == nil
                else {
                    return
                }
                do {
                    let model = try JSONDecoder().decode(PlaylistDetailResponse.self, from: data)//JSONSerialization.jsonObject(with: data)
//                    print(model)
                    completion(.success(model))
                    
                } catch let error {
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    public func getCurrentUserPlaylists(completion: @escaping((Result<[Playlist],Error>)->Void)) {
        createRequest(with: Endpoints.currentUserPlaylist.url, type: .GET) { baseRequest in
            let task = URLSession.shared.dataTask(with: baseRequest) { data, _, error in
                guard
                    let data = data,
                    error == nil
                else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }

                do {
                    let model = try JSONDecoder().decode(LibraryPlaylistResponse.self, from: data)//JSONSerialization.jsonObject(with: data)
                    completion(.success(model.items))
                    
                } catch (let error) {
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    public func createPlaylists(with name: String, completion: @escaping((Bool)->Void)) {
        getCurrentUserProfile { result in
            switch result {
            case .success(let model):
                self.createRequest(with: Endpoints.createPlaylist(id: model.id).url, type: .POST) { baseRequest in
                    var request = baseRequest
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    let json = [
                        "name" : name,
                        "public" : "true"
                    ]
                    request.httpBody = try? JSONSerialization.data(withJSONObject: json, options: .fragmentsAllowed)
                    let task = URLSession.shared.dataTask(with: baseRequest) { data, _, error in
                        guard
                            let data = data,
                            error == nil
                        else {
                            completion(false)
                            return
                        }
                        do {
                            let results = try JSONSerialization.jsonObject(with: data,options: .fragmentsAllowed)
                            print(results)
                            completion(true)
                        } catch (let error) {
                            print(error.localizedDescription)
                            completion(false)
                        }
                    }
                    task.resume()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    public func addTrackToPlaylist(track: AudioTrack, playlist: Playlist, completion:@escaping((Bool)-> Void)) {
        createRequest(with: Endpoints.addItemsToPlaylist(id: playlist.id).url,
                      type: .POST) { baseRequest in
            var request = baseRequest
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let json = [
                "uris":[track.uri]
            ]
            request.httpBody = try? JSONSerialization.data(withJSONObject: json, options: .fragmentsAllowed)
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard
                    let data = data,
                    error == nil
                else {
                    return
                }
                do {
                    let result = try JSONSerialization.jsonObject(with: data)
                    if let response = result as? [String:Any], response["snapshot_id"] as? String != nil {
                        completion(true)
                    }
                    print(result)
                } catch (let error) {
                    print(error.localizedDescription)
                }
            }
            task.resume()
        }
    }
    
    public func removeTrackFromPlaylsit(track: AudioTrack, playlist: Playlist, completion:@escaping((Bool)-> Void)) {
        
    }
    
    
    // MARK: - Profile
    public func getCurrentUserProfile(completion: @escaping((Result<UserProfile,Error>)-> Void)) {
        createRequest(with: Endpoints.profile.url, type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data,error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(UserProfile.self, from: data)
                    completion(.success(result))
                    print(result)
                } catch let error {
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    
    // MARK: - Browse
    
    public func getNewReleases(completion: @escaping((Result<NewReleasesResponse,Error>)->Void)) {
        createRequest(with: Endpoints.newRelease.url, type: .GET) { baseRequest in
            let task = URLSession.shared.dataTask(with: baseRequest) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                do {
                    let model = try JSONDecoder().decode(NewReleasesResponse.self, from: data)
                    completion(.success(model))
//                    print(model)
                } catch let error {
//                    print(error)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
        
    }
    
    public func getFeaturedPlaylist(completion: @escaping((Result<FeaturedPlaylistResponse,Error>)->())) {
        createRequest(with: Endpoints.featuredPlaylist.url,
                      type: .GET) { baseRequest in
            let task = URLSession.shared.dataTask(with: baseRequest) { data, _, error in
                guard let data = data,error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let model = try JSONDecoder().decode(FeaturedPlaylistResponse.self, from: data)//JSONSerialization.jsonObject(with: data)
                    print(model)
                    completion(.success(model))
                } catch let error {
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    public func getRecommendations(genres: Set<String>, completion: @escaping((Result<RecommendationsResponse,Error>)->Void)) {
        let seeds = genres.joined(separator: ",")
        createRequest(with: URL(string: API.url + Endpoints.recommendations.path + "?limit=10&seed_genres=\(seeds)"), type: .GET) { baseRequest in
//             print(baseRequest.url?.absoluteString)
            let task = URLSession.shared.dataTask(with: baseRequest) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                do {
                    let model = try JSONDecoder().decode(RecommendationsResponse.self, from: data)//JSONSerialization.jsonObject(with: data)
//                    print(model)
                    completion(.success(model))
                    
                } catch let error {
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    public func getRecommendationsGenre(completion: @escaping((Result<RecommendedGenreResponse,Error>)->Void)){
        createRequest(with: Endpoints.recommendationsGenre.url, type: .GET) { baseRequest in
            let task = URLSession.shared.dataTask(with: baseRequest) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                do {
                    let model = try JSONDecoder().decode(RecommendedGenreResponse.self, from: data)//JSONSerialization.jsonObject(with: data, options: [])
                    completion(.success(model))
//                    print("JSON OBJECT: -------", model)
                } catch let error {
                    completion(.failure(error))
//                    print(error.localizedDescription)
                }
            }
            task.resume()
        }
    }
    
    // MARK: - Category
    public func getCategories(completion: @escaping((Result<[Category],Error>) -> Void)) {
        createRequest(with: Endpoints.categories.url, type: .GET) { baseRequest in
            let task = URLSession.shared.dataTask(with: baseRequest) { data, _, error in
                guard
                    let data = data,
                    error == nil
                else {
                    completion(.failure(error!))
                    return
                }
                do {
                    let model = try JSONDecoder().decode(AllCategoriesResponse.self, from: data)//try JSONSerialization.jsonObject(with: data)
                    print(model)
                    completion(.success(model.categories.items))
                } catch let error {
                    print(error)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    public func getCategoryPlaylist(category: Category,completion: @escaping((Result<[Playlist],Error>) -> Void)) {
        createRequest(with: Endpoints.categoryPlaylist(id: category.id).url, type: .GET) { baseRequest in
            let task = URLSession.shared.dataTask(with: baseRequest) { data, _, error in
                guard
                    let data = data,
                    error == nil
                else {
                    completion(.failure(error!))
                    return
                }
                do {
                    let model = try JSONDecoder().decode(CategoryPlaylistResponse.self, from: data)//JSONSerialization.jsonObject(with: data)
                    print(model)
                    completion(.success(model.playlists.items))
                } catch let error {
                    print(error)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    // MARK: - Search
    public func search(with query: String, completion: @escaping((Result<[SearchResults],Error>) -> Void)) {
        createRequest(with: Endpoints.search(queryText: query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)).url,
                      type: .GET) { baseRequest in
            print(Endpoints.search(queryText: query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)).url.absoluteString)
            let task = URLSession.shared.dataTask(with: baseRequest) { data, _, error in
                guard
                    let data = data,
                    error == nil
                else {
                    return
                }
                do {
                    let result = try JSONDecoder().decode(SearchResultResponse.self, from: data)//JSONSerialization.jsonObject(with: data)
                    var searchResults: [SearchResults] = []
                    searchResults.append(contentsOf: result.tracks.items.compactMap({.track(model: $0)}))
                    searchResults.append(contentsOf: result.playlists.items.compactMap({.playlist(model: $0)}))
                    searchResults.append(contentsOf: result.albums.items.compactMap({.album(model: $0)}))
                    searchResults.append(contentsOf: result.artists.items.compactMap({.artist(model: $0)}))
                    completion(.success(searchResults))
                    
                } catch (let error) {
                    completion(.failure(error))
                    print(error.localizedDescription)
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
//            print(token)
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
