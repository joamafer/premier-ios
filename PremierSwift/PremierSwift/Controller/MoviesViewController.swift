import UIKit

class MoviesViewController: UITableViewController {
    
    var movies: [Movie]?
    var activityIndicatorView : UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupActivityIndicator()
        setupTableView()
        fetch()
    }
    
    // MARK: - Setup
    
    func setupNavigationBar() {
        title = NSLocalizedString("Top Movies", comment: "Top Movies")
    }
    
    func setupActivityIndicator() {
        self.activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        self.view.addSubview(self.activityIndicatorView)
        self.activityIndicatorView?.center = self.view.center
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: String(describing: MoviesCell.self), bundle: nil) , forCellReuseIdentifier: String(describing: MoviesCell.self))
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - Fetch
    
    func fetch() {
        
        APIService.fetch(beforeLoad: {
            
                self.activityIndicatorView?.startAnimating()
            
            }, afterLoad: {
                
                DispatchQueue.main.async(execute: { () -> Void in
                    self.activityIndicatorView?.stopAnimating()
                })
                
            }, success: { response in
                
                self.movies = Movie().mapArray(mappingArray: response)
                
                DispatchQueue.main.async(execute: { () -> Void in
                    self.tableView.reloadData()
                })
                
        }) { error in
            
            let alertController = UIAlertController(title: NSLocalizedString("Error", comment: "Error"),
                                                    message: error?.localizedDescription,
                                                    preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Cancel"),
                                                    style: .default, handler: nil))
            alertController.addAction(UIAlertAction(title: NSLocalizedString("Retry", comment: "Retry"),
                                                    style: .default, handler: { action in
                                                        self.fetch()
            }))
            
            DispatchQueue.main.async {
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
}

extension MoviesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let movies = self.movies {
            return movies.count
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220.0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MoviesCell.self), for: indexPath) as? MoviesCell {
            if let movie = self.movies?[indexPath.row] {
                cell.setup(movie: movie)
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
}