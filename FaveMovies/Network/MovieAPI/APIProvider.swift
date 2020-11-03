//
//  APIProvider.swift
//  FaveMovies
//
//  Created by Ahmad on 02/11/2020.
//  Copyright © 2020 Ahmad. All rights reserved.
//


import Moya

enum APIProvider {
    case getDiscoverMovies(page: Int)
    case getMovieDetails(id: Int)
}

extension APIProvider: TargetType {
    
    var baseURL: URL {
        return URL(string: AppURLs.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getDiscoverMovies:
            return "/discover/movie"
        case let .getMovieDetails(id):
            return "/movie/" + "\(id)"
            
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getDiscoverMovies, .getMovieDetails:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case let .getDiscoverMovies(page):
            return .requestParameters(parameters: ["api_key": tmdbAPIKey, "page": page, "language": "en-US"], encoding: URLEncoding.queryString)
        case .getMovieDetails:
            return .requestParameters(parameters: ["api_key": tmdbAPIKey, "language": "en-US"], encoding: URLEncoding.queryString)
        }
    }
    
    public var parameters: [String: AnyObject]? {
        var params: [String: AnyObject] = [:]
        switch self {
        case .getDiscoverMovies(let page):
            params["page"] = page as AnyObject
        case .getMovieDetails(let id):
            params["id"] = id as AnyObject
            
        }
        return params
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        switch self {
        default:
            return nil
        }
    }
}

