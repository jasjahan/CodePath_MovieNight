//
//  Movie.swift
//  Flixster
//
//  Created by Jasmine Jahan on 3/1/23.
//

import Foundation

struct MovieArray : Decodable{
    let results : [Movie]
}


struct Movie : Decodable{
    let original_title: String
    let overview: String
    let poster_path: URL
    let vote_average:Double
    let vote_count: Int
    let popularity :Double
    let backdrop_path : URL
    let id : Int
}
