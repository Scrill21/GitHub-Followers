//
//  GFError.swift
//  GitHubFollowers
//
//  Created by anthony byrd on 12/4/21.
//

import Foundation

enum GFError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Unable to reach server"
        case .thrownError(let error):
            print(error.localizedDescription)
            return "That pokemon does not exist\nPlease check your spelling"
        case .noData:
            return "The server responded with no data."
        case .unableToDecode:
            return "The server responded with bad data."
        }
    }
}
