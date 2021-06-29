//
//  TrendingMoviesTrendingMoviesInteractorOutput.swift
//  VIPER
//
//  Created by Magzhan on 03/06/2021.
//  Copyright © 2021 Magzhan. All rights reserved.
//

import Foundation

protocol TrendingMoviesInteractorOutput: class {

    func setTrendingMovies(_ movies : [MovieModel.Movie])
}
