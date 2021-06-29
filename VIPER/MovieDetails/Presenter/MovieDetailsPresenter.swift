//
//  MovieDetailsMovieDetailsPresenter.swift
//  VIPER
//
//  Created by Magzhan on 03/06/2021.
//  Copyright © 2021 Magzhan. All rights reserved.
//

class MovieDetailsPresenter: MovieDetailsModuleInput, MovieDetailsViewOutput, MovieDetailsInteractorOutput {
   

    weak var view: MovieDetailsViewInput!
    var interactor: MovieDetailsInteractorInput!
    var router: MovieDetailsRouterInput!
    
    private var  movieId : Int
    
    init(movieId : Int) {
        self.movieId = movieId
//        view.setMovieId(self.movieId)
    }

    func viewIsReady() {
        interactor.fetchMovieDetails(movieId)
    }
    
    func setMovieDetails(_ movie: MovieDetailedModel) {
        view.setMovieDetails(movie)
    }
    
}
