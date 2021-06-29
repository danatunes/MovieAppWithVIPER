//
//  HomeHomeInteractor.swift
//  VIPER
//
//  Created by Magzhan on 03/06/2021.
//  Copyright © 2021 Magzhan. All rights reserved.
//
import Alamofire

class HomeInteractor: HomeInteractorInput {
    
    weak var output: HomeInteractorOutput!
    
//    private let TODAY_MOVIES_URL: String = "https://api.themoviedb.org/3/movie/now_playing?api_key=9ece5d65fc09b295528a6680acfcc58b"
    
    func today_movies(){
        AF.request("\(Constants.TODAY_MOVIES_URL)\(Constants.API_KEY)", method: .get, parameters: [:]).responseJSON { [weak self] (response) in
            switch response.result {
            case .success :
                if let data = response.data {
                    do{
                     
                        let movieJSON = try JSONDecoder().decode(MovieModel.self, from: data)
                        print(movieJSON)
                        self?.output.setTodayAtCinema(movieJSON.results)
                    }catch let JSONError{
                        print(JSONError)
                    }
                }
            case .failure :
                print("TRENDING_MOVIES_URL retrive data")
            }
        }
    }
    
//    private let GET_GENRE_URL = "https://api.themoviedb.org/3/genre/movie/list?api_key=9ece5d65fc09b295528a6680acfcc58b"

    func getGenre() {
        AF.request("\(Constants.GET_GENRE_URL)\(Constants.API_KEY)", method: .get, parameters: [:]).responseJSON { [weak self] (response) in
            switch response.result {
            case .success :
                if let data = response.data {
                    do{
                     
                        let movieJSON = try JSONDecoder().decode(Genres.self, from: data)
                        print("..... genre \(movieJSON.genres)")
                        self?.output.setGenres(movieJSON.genres)
                    }catch let JSONError{
                        print(JSONError)
                    }
                }
            case .failure :
                print("TRENDING_MOVIES_URL retrive data")
            }
        }
    }
    
    func getComingMovies() {
        AF.request("\(Constants.SOON_MOVIES_URL)\(Constants.API_KEY)", method: .get, parameters: [:]).responseJSON { [weak self] (response) in
            switch response.result {
            case .success :
                if let data = response.data {
                    do{
                     
                        let movieJSON = try JSONDecoder().decode(MovieModel.self, from: data)
                        self?.output.setComingMovies(movieJSON.results)
                    }catch let JSONError{
                        print(JSONError)
                    }
                }
            case .failure :
                print("TRENDING_MOVIES_URL retrive data")
            }
        }
    }
    
    func getTrendingMovies() {
        AF.request("\(Constants.TRENDING_MOVIES_URL)\(Constants.API_KEY)", method: .get, parameters: [:]).responseJSON { [weak self] (response) in
            switch response.result {
            case .success :
                if let data = response.data {
                    do{
                        let movieJSON = try JSONDecoder().decode(MovieModel.self, from: data)
                        self?.output.setTrendingMovies(movieJSON.results)

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
