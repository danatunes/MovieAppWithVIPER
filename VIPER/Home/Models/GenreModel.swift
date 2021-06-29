//
//  GenreModel.swift
//  VIPER
//
//  Created by Магжан Бекетов on 04.06.2021.
//

import Foundation

struct Genres : Decodable{
    let genres : [Genre]
    
    struct Genre : Decodable{
        let id : Int
        let name : String
    }
}
