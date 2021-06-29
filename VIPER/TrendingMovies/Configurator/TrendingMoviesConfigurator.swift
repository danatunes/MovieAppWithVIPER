//
//  TrendingMoviesTrendingMoviesConfigurator.swift
//  VIPER
//
//  Created by Magzhan on 03/06/2021.
//  Copyright © 2021 Magzhan. All rights reserved.
//

import UIKit

class TrendingMoviesModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, moviesUrl : String) {

        if let viewController = viewInput as? TrendingMoviesViewController {
            configure(viewController: viewController, moviesUrl : moviesUrl)
        }
    }

    private func configure(viewController: TrendingMoviesViewController , moviesUrl : String) {

        let router = TrendingMoviesRouter()

        let presenter = TrendingMoviesPresenter(moviesUrl : moviesUrl)
        presenter.view = viewController
        presenter.router = router

        let interactor = TrendingMoviesInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
