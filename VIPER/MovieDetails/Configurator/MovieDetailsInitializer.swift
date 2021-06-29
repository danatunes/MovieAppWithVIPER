//
//  MovieDetailsMovieDetailsInitializer.swift
//  VIPER
//
//  Created by Magzhan on 03/06/2021.
//  Copyright © 2021 Magzhan. All rights reserved.
//

import UIKit

class MovieDetailsModuleInitializer: NSObject {

    func viewController(movieId : Int) -> UIViewController{
        let storyboard = UIStoryboard(name: "MovieDetails", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
        let configurator = MovieDetailsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: vc , movieId : movieId)
        
        return vc
    }

}
