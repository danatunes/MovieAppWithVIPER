//
//  HomeHomeRouter.swift
//  VIPER
//
//  Created by Magzhan on 03/06/2021.
//  Copyright © 2021 Magzhan. All rights reserved.
//
import UIKit

class HomeRouter: HomeRouterInput {
    
    func openAllMovies(with url: String, controller: UIViewController) {
        
        let newController = TrendingMoviesModuleInitializer().viewController(moviesUrl: url)
        controller.navigationController?.pushViewController(newController, animated: true)
    }
    func openMovieDetails(with id: Int, controller: UIViewController) {
        
        let newController = MovieDetailsModuleInitializer().viewController(movieId: id)
        controller.navigationController?.pushViewController(newController, animated: true)
        
    }
    
    
}
