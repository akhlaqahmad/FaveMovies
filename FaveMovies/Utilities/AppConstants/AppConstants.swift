//
//  AppConstants.swift
//  FaveMovies
//
//  Created by Ahmad on 01/11/2020.
//  Copyright © 2020 Ahmad. All rights reserved.
//

import UIKit

struct AppConstants {
    static let appTitle = "Fave Movies"
    static var Main = UIStoryboard(name: "Main", bundle: Bundle.main)
    
}

struct AppURLs {
    static let baseURL      = "http://api.themoviedb.org/3"
    static let imageBaseURL = "https://image.tmdb.org/t/p/w500/"
    static let bookMovie    = "https://www.cathaycineplexes.com.sg/"
}


enum ViewControllers: String {
    case moviesListSceneVC  = "MoviesSceneViewController"
    case movieDetailVC      = "MovieDetailViewController"
}


struct SegueIdentifier {
    static let editProfile              = "EditProfile"
}

struct StoryboardIdentifier {
    static let chat         = "ChatViewController"
}

struct DeviceInformation {
    static let deviceWidth  = UIScreen.main.bounds.size.width
    static let deviceHeight = UIScreen.main.bounds.size.height
    static let deviceScale  = UIScreen.main.scale
}

let tmdbAPIKey              = "328c283cd27bd1877d9080ccb1604c91"
