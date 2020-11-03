//
//  APIManager.swift
//  FaveMovies
//
//  Created by Ahmad on 02/11/2020.
//  Copyright © 2020 Ahmad. All rights reserved.
//

import UIKit
import Moya
import ObjectMapper

class APIManager {
    
    private init(){ }
    static var shared = APIManager()
    let provider = MoyaProvider<APIProvider>()
    
    
    func fetchMoviesList(pageNo: Int, success:@escaping ((_ moviesList: [MoviesListModel], _ pageNo: Int) -> Void), failure:@escaping ((_ msg: String) -> Void)) {
        provider.request(.getDiscoverMovies(page: pageNo)) { (result) in
            switch result {
                
            case let .success(response):
                let str = String.init(data: response.data, encoding: String.Encoding.utf8)
                if response.statusCode == 200 {
                    do {
                        
                        let responseModel = Mapper<MoviesListBaseModel>().map(JSONString: str ?? "")
                        success((responseModel?.moviesList!)!, (responseModel?.page)!)
                    }
                } else {
                    failure(str ?? "")
                }
                
            case .failure(_):
                break
            }
            
        }
    }
    
    func fetchMovieDetails(id: Int, success:@escaping ((_ moviesList: MovieDetailsModel) -> Void), failure:@escaping ((_ msg: String) -> Void)) {
        provider.request(.getMovieDetails(id: id)) { (result) in
            switch result {
                
            case let .success(response):
                let str = String.init(data: response.data, encoding: String.Encoding.utf8)
                if response.statusCode == 200 {
                    do {
                        let responseModel = Mapper<MovieDetailsModel>().map(JSONString: str ?? "")
                        success(responseModel!)
                    }
                } else {
                    failure(str ?? "")
                }
                
            case .failure(_):
                break
            }
            
        }
    }
    
}
