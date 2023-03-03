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
        movieName.text = movie.movieTitle
        movieDetail.text = movie.overview

        // Load image async via Nuke library image loading helper method
        Nuke.loadImage(with: movie.poster, into: movieImage)
    }

}
