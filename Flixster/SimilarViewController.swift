//
//  SimilarViewController.swift
//  Flixster
//
//  Created by Jasmine Jahan on 3/11/23.
//

import UIKit

class SimilarViewController: UIViewController, UITableViewDataSource {
   
    var movies: [Movie] = []
   
    var movie: Movie!
    @IBOutlet weak var tabView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        //631842
        
        
        let url = URL(string:"https://api.themoviedb.org/3/movie/631842/similar?api_key=b11a0ebf7a3f43540a27a57ab8822501&language=en-US&page=1")!

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
                    self?.tabView.reloadData()
                }
                print("✅ \(movies)")
            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
        }

        // Initiate the network request
        task.resume()
        print(movies)
        tabView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          if let indexPath = tabView.indexPathForSelectedRow {

              // Deselect the row at the corresponding index path
              tabView.deselectRow(at: indexPath, animated: true)
          }
         
      }
      
      
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if let cell = sender as? UITableViewCell,
             // Get the index path of the cell from the table view
             let indexPath = tabView.indexPath(for: cell),
             // Get the detail view controller
             let detailViewController = segue.destination as? DetailViewController {

              // Use the index path to get the associated track
              let track = movies[indexPath.row]

              // Set the track on the detail view controller
              detailViewController.movie = track
          }
      }
      
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return movies.count
      }
      
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "SimilarCell", for: indexPath) as! SimilarCell

          // Get the track that corresponds to the table view row
          let movie = movies[indexPath.row]

          // Configure the cell with it's associated track
          cell.configure(with: movie)

          // return the cell for display in the table view
          return cell
      }
    

}
