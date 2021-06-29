//
//  TrendingMoviesTrendingMoviesInteractor.swift
//  VIPER
//
//  Created by Magzhan on 03/06/2021.
//  Copyright © 2021 Magzhan. All rights reserved.
//
import Foundation
import Alamofire

class TrendingMoviesInteractor {
    
    weak var output: TrendingMoviesInteractorOutput!
    
    //    var TRENDING_MOVIES_URL : URL? {
    //        return URL(string: "https://api.themoviedb.org/3/trending/movie/week?api_key=9ece5d65fc09b295528a6680acfcc58b")
    //    }
    //      let DETAILED_MOVIE_URL = "https://api.themoviedb.org/3/movie/"
    //      let API_KEY = "?api_key=9ece5d65fc09b295528a6680acfcc58b"
    
}

extension TrendingMoviesInteractor : TrendingMoviesInteractorInput {
    func getMovies(_ pageNumber: Int, _ moviesUrl: String) {
        AF.request("\(moviesUrl)", method: .get, parameters: [:]).responseJSON { (response) in
            switch response.result {
            case .success :
                if let data = response.data {
                    do{
                     
                        let movieJSON = try JSONDecoder().decode(MovieModel.self, from: data)
                        self.output.setTrendingMovies(movieJSON.results)
                    }catch let JSONError{
                        print(JSONError)
                    }
                }
            case .failure :
                print("TRENDING_MOVIES_URL retrive data")
            }
        }
    }
}
