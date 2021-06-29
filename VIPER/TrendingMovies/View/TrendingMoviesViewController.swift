//
//  TrendingMoviesTrendingMoviesViewController.swift
//  VIPER
//
//  Created by Magzhan on 03/06/2021.
//  Copyright © 2021 Magzhan. All rights reserved.
//

import UIKit

class TrendingMoviesViewController: UIViewController {
    
    var output: TrendingMoviesViewOutput!
    @IBOutlet weak var tableView: UITableView!
    
    private var pageNumber = 1
    private var isLoading : Bool = false
    
    private var movies : [MovieModel.Movie] = [MovieModel.Movie]() {
        didSet {
            isLoading = false
            tableView.reloadData()
        }
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.register(MovieCell.nib, forCellReuseIdentifier: MovieCell.identifier)
        output.viewIsReady(pageNumber)
//        output.getTrendingMovies(pageNumber)
    }
    
    
    
   
}
// MARK: TrendingMoviesViewInput
extension TrendingMoviesViewController : TrendingMoviesViewInput{
    
    func setTrendingMovies(_ movies: [MovieModel.Movie]) {
        self.movies += movies
    }
    
    func setupInitialState() {
    }
    
    func getController() -> UIViewController {
        return self
    }
}

extension TrendingMoviesViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
        
        cell.movie = movies[indexPath.row]
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        let deltaOffset = maximumOffset - currentOffset
        
        if deltaOffset <= 10 &&  currentOffset > 200 && !isLoading{
            isLoading = true
            pageNumber += 1
            output.viewIsReady(pageNumber)
//            output.getTrendingMovies(pageNumber)
        }
    }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let idOfMovie = movies[indexPath.row].id
            output.openMovieDetails(with: idOfMovie)
        }
}
