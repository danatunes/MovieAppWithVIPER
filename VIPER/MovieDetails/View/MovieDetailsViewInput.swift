//
//  MovieDetailsMovieDetailsViewInput.swift
//  VIPER
//
//  Created by Magzhan on 03/06/2021.
//  Copyright © 2021 Magzhan. All rights reserved.
//

protocol MovieDetailsViewInput: class {

    /**
        @author Magzhan
        Setup initial state of the view
    */

    func setupInitialState()
    //func setMovieId(_ movieId : Int)
    func setMovieDetails(_ movie : MovieDetailedModel)
}
