//
//  HomeHomeViewInput.swift
//  VIPER
//
//  Created by Magzhan on 03/06/2021.
//  Copyright © 2021 Magzhan. All rights reserved.
//
import UIKit

protocol HomeViewInput: class {

    /**
        @author Magzhan
        Setup initial state of the view
    */

    func setupInitialState()
    func setTodayAtCinema(_ movies: [MovieModel.Movie]) 
    func setGenres(_ genres: [Genres.Genre])
    func setComingMovies(_ movies : [MovieModel.Movie])
    func setTrendingMovies(_ movies : [MovieModel.Movie])
    func getController() -> UIViewController

}
