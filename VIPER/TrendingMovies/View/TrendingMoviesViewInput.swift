//
//  TrendingMoviesTrendingMoviesViewInput.swift
//  VIPER
//
//  Created by Magzhan on 03/06/2021.
//  Copyright © 2021 Magzhan. All rights reserved.
//
import UIKit

protocol TrendingMoviesViewInput: class {

    /**
        @author Magzhan
        Setup initial state of the view
    */

    func setupInitialState()
    func setTrendingMovies(_ movies: [MovieModel.Movie])
    func getController() -> UIViewController
}
