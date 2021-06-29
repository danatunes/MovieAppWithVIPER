//
//  HomeHomeViewOutput.swift
//  VIPER
//
//  Created by Magzhan on 03/06/2021.
//  Copyright © 2021 Magzhan. All rights reserved.
//

protocol HomeViewOutput {

    /**
        @author Magzhan
        Notify presenter that view is ready
    */

    func viewIsReady()
    func todayMovies()
    func getGenre()
    func getComingMovies()
    func getTrendingMovies()
    func openMovieDetails(with idOfMovie : Int)
    func openAllMovies(with url : String)
}
