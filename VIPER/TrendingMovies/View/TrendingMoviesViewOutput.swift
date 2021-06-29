//
//  TrendingMoviesTrendingMoviesViewOutput.swift
//  VIPER
//
//  Created by Magzhan on 03/06/2021.
//  Copyright © 2021 Magzhan. All rights reserved.
//

protocol TrendingMoviesViewOutput {

    /**
        @author Magzhan
        Notify presenter that view is ready
    */

    func viewIsReady(_ pageNumber: Int)
  //  func getTrendingMovies(_ pageNumber : Int)
    func openMovieDetails(with id : Int)
}
