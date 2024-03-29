//
//  MovieCell.swift
//  Flixster
//
//  Created by Jasmine Jahan on 3/1/23.
//

import UIKit
import Nuke

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDetail: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        
    func configure(with movie: Movie) {
        let b = URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)")
        movieName.text = movie.original_title
        movieDetail.text = movie.overview
        Nuke.loadImage(with: b!, into: movieImage)
    }

}
