//
//  TrendingMoviesTrendingMoviesPresenter.swift
//  VIPER
//
//  Created by Magzhan on 03/06/2021.
//  Copyright © 2021 Magzhan. All rights reserved.
//

class TrendingMoviesPresenter: TrendingMoviesModuleInput {

    weak var view: TrendingMoviesViewInput!
    var interactor: TrendingMoviesInteractorInput!
    var router: TrendingMoviesRouterInput!

    private var  moviesUrl : String

    
    init(moviesUrl : String) {
        self.moviesUrl = moviesUrl
    }
    
}

extension TrendingMoviesPresenter  : TrendingMoviesViewOutput{
    func openMovieDetails(with id: Int) {
        router.openMovieDetails(with: id, controller: view.getController())
    }
    
    func viewIsReady(_ pageNumber: Int) {
        interactor.getMovies(pageNumber, moviesUrl)
    }
    
//    func getTrendingMovies(_ pageNumber: Int) {
//        interactor.getTrendingMovies(pageNumber)
//    }
    
   
    
}


extension TrendingMoviesPresenter : TrendingMoviesInteractorOutput {
    func setTrendingMovies(_ movies: [MovieModel.Movie]) {
        view.setTrendingMovies(movies)
    }
}
