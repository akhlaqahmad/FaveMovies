//
//  MoviesListBaseModel.swift
//  FaveMovies
//
//  Created by Ahmad on 01/11/2020.
//  Copyright © 2020 Ahmad. All rights reserved.
//

import Foundation
import ObjectMapper

struct MoviesListBaseModel : Mappable {
    var page : Int?
    var total_results : Int?
    var total_pages : Int?
    var moviesList : [MoviesListModel]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        page <- map["page"]
        total_results <- map["total_results"]
        total_pages <- map["total_pages"]
        moviesList <- map["results"]
    }

}
