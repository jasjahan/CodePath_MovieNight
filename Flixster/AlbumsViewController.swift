//
//  AlbumsViewController.swift
//  Flixster
//
//  Created by Jasmine Jahan on 3/11/23.
//

import UIKit
import Nuke

class AlbumsViewController: UIViewController, UICollectionViewDataSource {
   
    var movies: [Movie] = []

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
//        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//
//        // The minimum spacing between adjacent cells (left / right, in vertical scrolling collection)
//        // Set this to taste.
//        layout.minimumInteritemSpacing = 2
//
//        // The minimum spacing between adjacent cells (top / bottom, in vertical scrolling collection)
//        // Set this to taste.
//        layout.minimumLineSpacing = 2
//
//        // Set this to however many columns you want to show in the collection.
//        let numberOfColumns: CGFloat = 2
//
//        // Calculate the width each cell need to be to fit the number of columns, taking into account the spacing between cells.
//        let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns
//
//        // Set the size that each tem/cell should display at
//        layout.itemSize = CGSize(width: width, height: width)
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
               layout.minimumLineSpacing = 4
               layout.minimumInteritemSpacing = 4
               
               let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2)/3
               layout.itemSize = CGSize(width: width, height: width * 3/2)

        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=b11a0ebf7a3f43540a27a57ab8822501")!

        // Use the URL to instantiate a request
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in

            // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }

            // Make sure we have data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }

            do {
                // Create a JSON Decoder
                let decoder = JSONDecoder()

                
                // Use the JSON decoder to try and map the data to our custom model.
                let response = try decoder.decode(MovieArray.self, from: data)

                // Access the array of tracks from the `results` property
                let movies = response.results
                
                DispatchQueue.main.async {

                    // Set the view controller's tracks property as this is the one the table view references
                    self?.movies = movies
                    // Make the table view reload now that we have new data
                    self?.collectionView.reloadData()
                }
                guard let jsonDictionary = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print("❌ Could not cast data to dictionary")
                    return
                }
                print(jsonDictionary)
                print("✅ \(movies)")
            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
        }

        // Initiate the network request
        task.resume()
        print(movies)
        
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCell", for: indexPath) as! AlbumCell

           // Use the indexPath.item to index into the albums array to get the corresponding album
           let album = movies[indexPath.item]

           // Get the artwork image url
        let b = URL(string: "https://image.tmdb.org/t/p/w500\(album.poster_path)")
        Nuke.loadImage(with: b!, into: cell.albumImageView)
//            let imageUrl = album.poster_path
//
//           // Set the image on the image view of the cell
//           Nuke.loadImage(with: imageUrl, into: cell.albumImageView)

           return cell
    }
    
}
