//
//  HomeHomePresenter.swift
//  VIPER
//
//  Created by Magzhan on 03/06/2021.
//  Copyright © 2021 Magzhan. All rights reserved.
//

class HomePresenter: HomeModuleInput, HomeViewOutput, HomeInteractorOutput {
    func openAllMovies(with url: String) {
        router.openAllMovies( with: url , controller : view.getController())
    }

    func openMovieDetails(with idOfMovie: Int) {
        router.openMovieDetails(with: idOfMovie, controller: view.getController())
    }
    
    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!

    
    func setTrendingMovies(_ movies: [MovieModel.Movie]) {
        view.setTrendingMovies(movies)
    }
    
    
    func getTrendingMovies() {
        interactor.getTrendingMovies()
    }
    
   
    func setComingMovies(_ movies : [MovieModel.Movie]) {
        view.setComingMovies(movies)
    }
    
   
    func getComingMovies() {
        interactor.getComingMovies()
    }
    
    func setGenres(_ genres: [Genres.Genre]) {
        view.setGenres(genres)
    }
    
    func getGenre() {
        interactor.getGenre()
    }
    
    func setTodayAtCinema(_ movies: [MovieModel.Movie]) {
        view.setTodayAtCinema(movies)
    }
    
    func todayMovies() {
        interactor.today_movies()
    }
    
    func viewIsReady() {

    }
}
