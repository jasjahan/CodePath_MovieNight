//
//  DetailViewController.swift
//  Flixster
//
//  Created by Jasmine Jahan on 3/1/23.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {


    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var voteAvg: UILabel!
    @IBOutlet weak var voteCount: UILabel!
    @IBOutlet weak var pop: UILabel!
    @IBOutlet weak var detail: UILabel!
        
    var movie: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        let b = URL(string: "https://image.tmdb.org/t/p/w500\(movie.backdrop_path)")
        Nuke.loadImage(with: b!, into: poster)
        name.text = movie.original_title
        detail.text = movie.overview
        voteAvg.text = String(movie.vote_average)
        voteCount.text = String(movie.vote_count)
        pop.text = String(movie.popularity)
               
    }

}
