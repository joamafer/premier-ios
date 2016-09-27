import UIKit

class MoviesViewController: UITableViewController {
    
    private var movies: [[String: Any]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Top Movies"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellIdentifier")
        let moviesURL = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=e4f9e61f6ffd66639d33d3dde7e3159b")
        URLSession.shared.dataTask(with: moviesURL!) { (responseData, _, _) in
            if let data = responseData {
                let JSON = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue:0)) as! [String: Any]
                self.movies = JSON["results"] as! [[String: Any]]
                self.tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
            }
        }.resume()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        cell.textLabel!.text = movie["title"] as? String
        return cell
    }
}

