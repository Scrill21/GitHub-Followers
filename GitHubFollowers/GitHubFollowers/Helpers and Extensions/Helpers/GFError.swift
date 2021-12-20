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
            return "This username created an invalid request. Please try again."
        case .thrownError(let error):
            print(error.localizedDescription)
            return "Unable to complete your request. Please check your internet connection"
        case .noData:
            return "The data received from the server was invalid. Please try again."
        case .unableToDecode:
            return "The server responded with bad data."
        }
    }
}
