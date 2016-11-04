//
//  MoviesCell.swift
//  PremierSwift
//
//  Created by JOSE ANTONIO MARTINEZ FERNANDEZ on 01/11/2016.
//  Copyright © 2016 Deliveroo. All rights reserved.
//

import UIKit

class MoviesCell: UITableViewCell {
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!

    func setup(movie: Movie) {
        
        self.posterImageView.image = UIImage(named: "Placeholder")
        
        if let posterPath = movie.posterPath {
            let baseURL = "https://image.tmdb.org/t/p/w300_and_h450_bestv2/"
            if let url = URL(string: baseURL + posterPath) {
                
                URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                    if error != nil {
                        print(error)
                        
                        return
                    }
                    
                        if let data = data, let image = UIImage(data: data) {
                            DispatchQueue.main.async(execute: { () -> Void in
                                self.posterImageView.image = image
                            })
                        }
                }).resume()
            }
        }
        
        if let title = movie.title {
            self.titleLabel.attributedText = title.titleStyle()
        } else {
            self.titleLabel.isHidden = true
        }
        
        if let overview = movie.overview {
            self.overviewLabel.attributedText = overview.bodyStyle()
        } else {
            self.overviewLabel.isHidden = true
        }
    }
}
