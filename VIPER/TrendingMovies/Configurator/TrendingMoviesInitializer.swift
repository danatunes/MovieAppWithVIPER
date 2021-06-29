//
//  TrendingMoviesTrendingMoviesInitializer.swift
//  VIPER
//
//  Created by Magzhan on 03/06/2021.
//  Copyright © 2021 Magzhan. All rights reserved.
//

import UIKit

class TrendingMoviesModuleInitializer: NSObject {
    
    func viewController(moviesUrl : String) -> UIViewController{
        let storyboard = UIStoryboard(name: "TrendingMoviesStoryboard", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "TrendingMoviesViewController") as! TrendingMoviesViewController
        let configurator = TrendingMoviesModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: vc , moviesUrl : moviesUrl)
        
        return vc
    }
}
