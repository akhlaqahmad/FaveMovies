//
//  MoviesListViewController.swift
//  FaveMovies
//
//  Created by Ahmad on 02/11/2020.
//  Copyright © 2020 Ahmad. All rights reserved.
//

import UIKit
import UIScrollView_InfiniteScroll
import AMRefresher

class MoviesListViewController: UIViewController {
    
    @IBOutlet weak var moviesTableView: UITableView! {
        didSet {
            moviesTableView.register(UINib.init(nibName: MovieTableViewCell.cellIdentifier, bundle: Bundle.main), forCellReuseIdentifier: MovieTableViewCell.cellIdentifier)
            moviesTableView.estimatedRowHeight = 200
            moviesTableView.rowHeight = UITableView.automaticDimension
        }
    }
    
    
    // MARK: Private Varivales
    private var shouldShowSkeleton = true
    var moviesListArray = [MoviesListModel]()
    var movieCellData = [MovieCellData]()
    var page: Int?
    
    
    // MARK: View Controller Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = AppConstants.appTitle
        addLoadMore()
        addPullToRefresh()
        fetchMoviesList(withPageNo: 1)
    }
    
    // MARK: Private Functions
    
    //Fetch Movies Inital call
    private func fetchMoviesList(withPageNo pageNo: Int) {
        if ReachibilityManager.shared.isConnectedWithInternet() {
            
            APIManager.shared.fetchMoviesList(pageNo: pageNo, success: { [weak self] (movies,page) in
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    
                    self?.moviesTableView?.finishInfiniteScroll()
                    self?.moviesTableView.am.pullToRefreshView?.stopRefreshing()
                    self?.page = page
                    self?.shouldShowSkeleton = false
                    self?.moviesListArray.append(contentsOf: movies)
                    self?.movieCellData = (self?.moviesListArray.compactMap { MovieCellData(model: $0) })!
                    self?.moviesTableView.reloadData()
                }
                
            }) { (errorMessage) in
                print(errorMessage)
            }
        }
    }
    
    // MARK: Load More
    func addLoadMore() {
        moviesTableView.addInfiniteScroll { [weak self] tbl in
            self?.fetchMoviesList(withPageNo: (self?.page ?? 0) + 1 )
        }
    }
    
    // MARK: Load More when reach to half of the fetched item --> for better experiance
    func loadMoreDuringScrolling(indexPath: IndexPath) {
        if indexPath.item % (moviesListArray.count/2) == 0 {
            fetchMoviesList(withPageNo: (page ?? 0) + 1 )
        }
    }
    
    // MARK: Pull to refresh to fetch latest
    func addPullToRefresh() {
        moviesTableView.am.addPullToRefresh { [unowned self] in
            shouldShowSkeleton = true
            moviesTableView.reloadData()
            moviesListArray = []
            movieCellData = []
            fetchMoviesList(withPageNo: 1)
            
        }
    }
    
}


// MARK: TableView Delegate Methods
extension MoviesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if !moviesListArray.isEmpty { loadMoreDuringScrolling(indexPath: indexPath) }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shouldShowSkeleton ? 10 : 180
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.cellIdentifier, for: indexPath) as! MovieTableViewCell
        shouldShowSkeleton ? cell.showSkeleton() : cell.hideSkeleton()
        if !moviesListArray.isEmpty { cell.configureCell(movieCellData[indexPath.row]) }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard !movieCellData.isEmpty else { return }
        
        let detailVC = self.storyboard?.instantiateViewController(identifier: ViewControllers.movieDetailVC.rawValue) as! MovieDetailViewController
        detailVC.movieData = self.movieCellData[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
}
