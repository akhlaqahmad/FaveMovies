//
//  MoviesListModel.swift
//  FaveMovies
//
//  Created by Ahmad on 01/11/2020.
//  Copyright © 2020 Ahmad. All rights reserved.
//

import Foundation
import ObjectMapper

struct MoviesListModel : Mappable {
    var popularity : Double?
    var vote_count : Int?
    var video : Bool?
    var poster_path : String?
    var id : Int?
    var adult : Bool?
    var backdrop_path : String?
    var original_language : String?
    var original_title : String?
    var genre_ids : [Int]?
    var title : String?
    var vote_average : Double?
    var overview : String?
    var release_date : String?

    init?(map: Map) {

    }
    
    init(model: MoviesListModel) {
        
        self.popularity  = model.popularity
        self.popularity  = model.popularity
        self.video       = model.video
        self.poster_path = model.poster_path
        self.id          = model.id
        self.adult       = model.adult
        self.backdrop_path = model.backdrop_path
        self.original_language = model.original_language
        self.original_title = model.original_title
        self.genre_ids      = model.genre_ids
        self.title          = model.title
        self.vote_average   = model.vote_average
        self.overview = model.overview
        self.release_date = model.release_date
    }

    mutating func mapping(map: Map) {

        popularity <- map["popularity"]
        vote_count <- map["vote_count"]
        video <- map["video"]
        poster_path <- map["poster_path"]
        id <- map["id"]
        adult <- map["adult"]
        backdrop_path <- map["backdrop_path"]
        original_language <- map["original_language"]
        original_title <- map["original_title"]
        genre_ids <- map["genre_ids"]
        title <- map["title"]
        vote_average <- map["vote_average"]
        overview <- map["overview"]
        release_date <- map["release_date"]
    }

}
