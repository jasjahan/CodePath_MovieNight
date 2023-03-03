//
//  DetailViewController.swift
//  Flixster
//
//  Created by Jasmine Jahan on 3/1/23.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var voteAvg: UILabel!
    @IBOutlet weak var voteTotal: UILabel!
    
    @IBOutlet weak var overv: UILabel!
    var movie: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Load the image located at the `artworkUrl100` URL and set it on the image view.
        Nuke.loadImage(with: movie.poster, into: imageView)

        // Set labels with the associated track values.
        name.text = movie.voteCount
        overv.text = movie.overview
        voteTotal.text = movie.vote
        
        
        

        // Create a date formatter to style our date and convert it to a string
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        voteAvg.text = dateFormatter.string(from: movie.release)


    }

}
