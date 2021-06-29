//
//  MovieDetailsMovieDetailsInteractor.swift
//  VIPER
//
//  Created by Magzhan on 03/06/2021.
//  Copyright © 2021 Magzhan. All rights reserved.
//
import Alamofire

class MovieDetailsInteractor {

    weak var output: MovieDetailsInteractorOutput!

}

extension MovieDetailsInteractor : MovieDetailsInteractorInput{
    func fetchMovieDetails(_ id : Int){
        AF.request("\(Constants.DETAILED_MOVIE_URL)\(id)\(Constants.API_KEY)", method: .get, parameters: [:]).responseJSON { [weak self] (response) in
            switch response.result {
            case .success :
                
                if let data = response.data {
                    do{
                        
                        let movieJSON = try JSONDecoder().decode(MovieDetailedModel.self, from: data)
                        self?.output.setMovieDetails(movieJSON)
                        
                        //                        print(".... \(movie)")
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
