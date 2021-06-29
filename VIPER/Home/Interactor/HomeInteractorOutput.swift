//
//  HomeHomeInteractorOutput.swift
//  VIPER
//
//  Created by Magzhan on 03/06/2021.
//  Copyright © 2021 Magzhan. All rights reserved.
//

import Foundation

protocol HomeInteractorOutput: class {
    
    func setTodayAtCinema(_ movies : [MovieModel.Movie])
    func setGenres(_ genres : [Genres.Genre])
    func setComingMovies(_ movies : [MovieModel.Movie])
    func setTrendingMovies(_ movies : [MovieModel.Movie])
}
