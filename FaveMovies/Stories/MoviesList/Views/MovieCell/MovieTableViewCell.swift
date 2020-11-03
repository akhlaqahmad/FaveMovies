//
//  MovieTableViewCell.swift
//  FaveMovies
//
//  Created by Ahmad on 02/11/2020.
//  Copyright © 2020 Ahmad. All rights reserved.
//

import UIKit
import SkeletonView
import SDWebImage

class MovieTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "MovieTableViewCell"
    
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var moviePopularityLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieBackDropImageView: UIImageView!
    @IBOutlet weak var blurView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        blurView.layer.cornerRadius = 8.0
        blurView.layer.masksToBounds = true
        
        movieBackDropImageView.layer.cornerRadius = 8.0
        movieBackDropImageView.layer.masksToBounds = true

        addBlurEffectView(view: blurView, alpha: 0.4)
    }
    
    func configureCell(_ movieCellData: MovieCellData) {
        self.movieTitleLabel.text = movieCellData.movieTitle
        self.moviePopularityLabel.text =  String(format: "%.1f", movieCellData.moviePopularity ?? 0.0)
        if let movieBackDropImage = movieCellData.movieBackDropImage, let moviePoster = movieCellData.movieImage {
            
            let url1 = AppURLs.imageBaseURL + movieBackDropImage
            let url2 = AppURLs.imageBaseURL + moviePoster
            movieImageView.sd_setImage(with: URL(string: url2), placeholderImage: #imageLiteral(resourceName: "placeholder"))
            movieBackDropImageView.sd_setImage(with: URL(string: url1), placeholderImage: #imageLiteral(resourceName: "placeholder"))
        }
    }
    
    func showSkeleton() {
        
        [movieTitleLabel, moviePopularityLabel, movieImageView, movieBackDropImageView].forEach({$0.showAnimatedGradientSkeleton()})
    }
    
    func hideSkeleton() {
        [movieTitleLabel, moviePopularityLabel, movieImageView, movieBackDropImageView].forEach({$0?.hideSkeleton()})
    }
    
    
    
}

struct MovieCellData {
    var movieID: Int?
    var movieTitle : String?
    var moviePopularity : Double?
    var movieImage : String?
    var movieBackDropImage : String?
    var errorMessage: String
    
    
    init(model: MoviesListModel) {
        
        movieID             = model.id ?? 00
        movieTitle          = model.title ?? ""
        moviePopularity     = model.popularity ?? 0.0
        movieImage          = model.poster_path ?? ""
        movieBackDropImage  = model.backdrop_path ?? ""
        errorMessage        =  ""
    }
}
