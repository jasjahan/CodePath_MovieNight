//
//  SimilarCell.swift
//  Flixster
//
//  Created by Jasmine Jahan on 3/11/23.
//

import UIKit
import Nuke

class SimilarCell: UITableViewCell {

    @IBOutlet weak var sameImage: UIImageView!
    @IBOutlet weak var sameDetail: UILabel!
    @IBOutlet weak var sameName: UILabel!
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
        sameName.text = movie.original_title
        sameDetail.text = movie.overview
        Nuke.loadImage(with: b!, into: sameImage)
    }

}
