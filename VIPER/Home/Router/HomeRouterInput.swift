//
//  HomeHomeRouterInput.swift
//  VIPER
//
//  Created by Magzhan on 03/06/2021.
//  Copyright © 2021 Magzhan. All rights reserved.
//

import Foundation
import UIKit

protocol HomeRouterInput {
    func openMovieDetails(with id: Int , controller : UIViewController)
    func openAllMovies(with url : String , controller : UIViewController)
    
}
