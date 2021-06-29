//
//  HomeHomeViewController.swift
//  VIPER
//
//  Created by Magzhan on 03/06/2021.
//  Copyright © 2021 Magzhan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, HomeViewInput {
    
    var output: HomeViewOutput!
    
    @IBOutlet weak var todayAllBtn: UIButton!
    @IBOutlet weak var soonAllBtn: UIButton!
    @IBOutlet weak var trendingAllBtn: UIButton!
    @IBOutlet weak var cinemaVC: UICollectionView!
    @IBOutlet weak var comingSoonCV: UICollectionView!
    @IBOutlet weak var trendingCV: UICollectionView!
    
    private var cinemaMovies : [MovieModel.Movie] = []{
        didSet{
            cinemaVC.reloadData()
        }
    }
    private var comingMovies : [MovieModel.Movie] = []{
        didSet{
//            print(",,,coming movies\(comingMovies)")
            comingSoonCV.reloadData()
        }
    }
    private var trendingMovies : [MovieModel.Movie] = []{
        didSet{
//            print("... in view controller \(trendingMovies)")
            trendingCV.reloadData()
        }
    }
    
    private var genres : [Genres.Genre] = []
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        output.getGenre()
        output.todayMovies()
        
        output.getComingMovies()
        output.getTrendingMovies()
        navigationItem.title = "Main"
        navigationController?.navigationBar.barTintColor = UIColor.clear
        tabBarController?.tabBar.tintColor = UIColor.yellow

        configureViews()
    }
    
    
    private func configureViews(){
        cinemaVC.delegate = self
        cinemaVC.dataSource = self
        cinemaVC.register(MovieCVCell.nib, forCellWithReuseIdentifier: MovieCVCell.identifier)
        
        comingSoonCV.delegate = self
        comingSoonCV.dataSource = self
        comingSoonCV.register(MovieCVCell.nib, forCellWithReuseIdentifier: MovieCVCell.identifier)
        
        trendingCV.delegate = self
        trendingCV.dataSource = self
        trendingCV.register(MovieCVCell.nib, forCellWithReuseIdentifier: MovieCVCell.identifier)
        
        navigationController?.title = "Movies"
    }
    
    // MARK: HomeViewInput
    func setupInitialState() {
    }
    
    func setTodayAtCinema(_ movies: [MovieModel.Movie]) {
        cinemaMovies = movies
    }
    
    func setGenres(_ genres: [Genres.Genre]) {
        self.genres = genres
    }
    
    func setComingMovies(_ movies: [MovieModel.Movie]) {
        self.comingMovies = movies
    }
    
    func setTrendingMovies(_ movies: [MovieModel.Movie]) {
        self.trendingMovies = movies
    }
    
    func getController() -> UIViewController {
        return self
    }
    
    @IBAction func showAllButton(_ sender: UIButton) {
        if sender == todayAllBtn{
            print(",,, TODAY BTN PRESSED")
            let url = "\(Constants.TODAY_MOVIES_URL)\(Constants.API_KEY)"
            output.openAllMovies(with : url)
        }else if sender == soonAllBtn{
            print(",,, soonAllBtn BTN PRESSED")
            let url = "\(Constants.SOON_MOVIES_URL)\(Constants.API_KEY)"
            output.openAllMovies(with : url)
        }else{
            print(",,, TRENDING_MOVIES_URL BTN PRESSED")
            let url = "\(Constants.TRENDING_MOVIES_URL)\(Constants.API_KEY)"
            output.openAllMovies(with : url)
        }
        print(".,,,, btn persed")
    }
    
}

extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == cinemaVC {
            return cinemaMovies.count
        } else if collectionView == comingSoonCV{
            return comingMovies.count
        }else{
            return trendingMovies.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == cinemaVC{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCVCell.identifier, for: indexPath) as! MovieCVCell
            cell.movie = cinemaMovies[indexPath.row]
           cell.genres = genres
            return cell
        }
        else if collectionView == comingSoonCV{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCVCell.identifier, for: indexPath) as! MovieCVCell
            cell.movie = comingMovies[indexPath.row]
            cell.genres = genres
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCVCell.identifier, for: indexPath) as! MovieCVCell
            cell.movie = trendingMovies[indexPath.row]
            cell.genres = genres
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == cinemaVC{
            let idOfMovie = cinemaMovies[indexPath.row].id
            output.openMovieDetails(with: idOfMovie)
        }else if collectionView == comingSoonCV{
            let idOfMovie = comingMovies[indexPath.row].id
            output.openMovieDetails(with: idOfMovie)
        }else {
            let idOfMovie = trendingMovies[indexPath.row].id
            output.openMovieDetails(with: idOfMovie)
        }
        
    }
    
}



extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 300, height: 300)
    }
}
