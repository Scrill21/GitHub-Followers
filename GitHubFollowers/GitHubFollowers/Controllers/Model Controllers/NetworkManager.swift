//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by anthony byrd on 11/30/21.
//

import UIKit

class NetworkManager {
    
    //MARK: - Singleton
    static let shared = NetworkManager()
    
    //MARK: - Properties
    private let baseURL = "https://api.github.com/users/"
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getFollower(for username: String, page: Int, completion: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            if let response = response as? HTTPURLResponse {
                print("GET FOLLOWERS STATUS CODE: \(response.statusCode)")
            }
            
            guard let data = data else { return completion(.failure(.noData)) }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let follower = try decoder.decode([Follower].self, from: data)
                completion(.success(follower))
            } catch {
                completion(.failure(.unableToDecode))
            }
        }
        task.resume()
    }
    
    func getUserInfo(for username: String, completion: @escaping (Result<User, GFError>) -> Void) {
        let endpoint = baseURL + "\(username)"
        
        guard let url = URL(string: endpoint) else { return completion(.failure(.invalidURL)) }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error { return completion(.failure(.thrownError(error))) }
            
            if let response = response as? HTTPURLResponse {
                print("GET USER STATUS CODE: \(response.statusCode)")
            }
            
            guard let data = data else { return completion(.failure(.noData)) }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let user = try decoder.decode(User.self, from: data)
                completion(.success(user))
            } catch {
                completion(.failure(.unableToDecode))
            }
        }
        task.resume()
    }
}
