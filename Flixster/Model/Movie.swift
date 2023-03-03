//
//  Movie.swift
//  Flixster
//
//  Created by Jasmine Jahan on 3/1/23.
//

import Foundation


struct Movie {
    let movieTitle: String
    let overview: String
    let poster: URL
    let release: Date
    let voteCount: String
    let vote : String
  
    
}

extension Movie {
    
    /// An array of mock tracks
    static var mockMovie: [Movie]  = [
        Movie(movieTitle: "Little Dixie",
              overview: "Erstwhile Special Forces operative Doc Alexander is asked to broker a truce with the Mexican drug cartel in secrecy. When Oklahoma Governor   Richard Jeffs celebrates the execution of a high-ranking cartel member on TV, his Chief of Staff and Doc inform him about the peace he just ended. But it’s too late, as Cuco, the cartel’s hatchet man, has set his vengeful sights on Doc’s daughter Dixie.",
              poster:URL(string:"https://image.tmdb.org/t/p/w500/cmWTZj9zzT9KFt3XyL0gssL7Ig8.jpg")!,
              release:Date(),
              voteCount: "Little Dixie",
              vote: "573"),
        Movie(movieTitle: "Huesera",
              overview: "Valeria's joy at becoming a first-time mother is quickly taken away when she's cursed by a sinister entity. As danger closes in, she's forced deeper into a chilling world of dark magic that threatens to consume her.",
              poster:URL(string:"https://image.tmdb.org/t/p/w500/1mZcxuL4GLUvPdEXC4iZPjG2EO3.jpg")!,
              release:Date(),
              voteCount: "Huesera: The Bone Woman",
              vote: "500"),
        Movie(movieTitle: "Shotgun Wedding",
              overview: "Darcy and Tom gather their families for the ultimate destination wedding but when the entire party is taken hostage, “’Til Death Do Us Part” takes on a whole new meaning in this hilarious, adrenaline-fueled adventure as Darcy and Tom must save their loved ones—if they don’t kill each other first.",
              poster:URL(string:"https://image.tmdb.org/t/p/w500/t79ozwWnwekO0ADIzsFP1E5SkvR.jpg")!,
              release:Date(),
              voteCount: "Shotgun Wedding",
              vote: "555"),
        Movie(movieTitle: "Transfusion",
              overview: "Ryan Logan, a former Special Forces operative, is battling to cope with life after the loss of his wife. He is thrusted into the criminal underworld to keep his only son from being taken from him.",
              poster:URL(string:"https://image.tmdb.org/t/p/w500/bxh5xCCW9Ynfg6EZJWUkc1zqTnr.jpg")!,
              release:Date(),
              voteCount: "Transfusion",
              vote: "122"),
        Movie(movieTitle: "Unicorn Wars",
              overview: "An army of bear cubs train and indoctrinate young recruits for the war against the unicorns, which threatens the safety of the cubs. Brothers Bluet and Tubby, along with a group of inexperienced cadets, are sent on a dangerous mission to save the Magic Forest, where the unicorns live, and start a terrible battle.",
              poster:URL(string:"https://image.tmdb.org/t/p/w500/8KBj11zBaRdhoeq1q9jcAwKmDSk.jpg")!,
              release:Date(),
              voteCount: "Unicorn Wars",
              vote: "12"),
    ]
}
