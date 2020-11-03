//
//  MovieDetailViewController.swift
//  FaveMovies
//
//  Created by Ahmad on 04/11/2020.
//  Copyright © 2020 Ahmad. All rights reserved.
//

import UIKit
import SkeletonView
import SDWebImage

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var movieTitlelabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var synopsisTextView: UITextView!
    
    var movieData: MovieCellData!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchMovieDetails(with: movieData?.movieID ?? 0)
    }
    
    @IBAction func bookMovieTapped(_ sender: Any) {
        
        if let url = URL(string: AppURLs.bookMovie) {
            UIApplication.shared.open(url)
        }
    }
    
    func setupView() {
        showSkeleton()
        let url = URL(string: AppURLs.imageBaseURL + movieData.movieBackDropImage!)
        movieTitlelabel.text = movieData.movieTitle
        backDropImageView.sd_setImage(with: url)
    }
    
    func showSkeleton() {
        [genresLabel, languageLabel, synopsisTextView].forEach({$0.showAnimatedGradientSkeleton()})
    }
    
    func hideSkeleton() {
        [genresLabel, languageLabel, synopsisTextView].forEach({$0?.hideSkeleton()})
    }
    
    
    func fetchMovieDetails(with id: Int) {
        APIManager.shared.fetchMovieDetails(id: id, success: { [weak self] (movie) in
            
            let genres = movie.genres?.compactMap {$0.name}
            self?.genresLabel.text = genres?.joined(separator: ", ")
            self?.languageLabel.text = movie.original_language
            self?.synopsisTextView.text = movie.overview
            self?.hideSkeleton()
        }, failure: { (errorMessage) in
            print(errorMessage)
        })
    }

}
