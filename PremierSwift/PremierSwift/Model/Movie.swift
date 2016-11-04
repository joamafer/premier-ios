import UIKit

class Movie: NSObject {
    var adult: Bool?
    var backdropPath: String?
    var uuid: Int?
    var originalLanguage: String?
    var originalTitle: String?
    var overview: String?
    var popularity: Int?
    var posterPath: String?
    var releaseDate: String?
    var title: String?
    var video: Bool?
    var voteAverage: Int?
    var voteCount: Int?
    
    func mapArray(mappingArray: [AnyObject]) -> [Movie] {
        var mapArray = [Movie]()
        for mappingObject in mappingArray {
            if let mappingMovie = mappingObject as? [String: Any] {
                let movie = Movie()
                movie.map(mappingObject: mappingMovie)
                mapArray.append(movie)
            }
        }
        
        return mapArray
    }
    
    func map(mappingObject: [String: Any]) {
        if let adult = mappingObject["adult"] as? Bool {
            self.adult = adult
        }
        if let backdropPath = mappingObject["backdrop_path"] as? String {
            self.backdropPath = backdropPath
        }
        if let uuid = mappingObject["uuid"] as? Int {
            self.uuid = uuid
        }
        if let originalLanguage = mappingObject["original_language"] as? String {
            self.originalLanguage = originalLanguage
        }
        if let originalTitle = mappingObject["original_title"] as? String {
            self.originalTitle = originalTitle
        }
        if let overview = mappingObject["overview"] as? String {
            self.overview = overview
        }
        if let popularity = mappingObject["popularity"] as? Int {
            self.popularity = popularity
        }
        if let posterPath = mappingObject["poster_path"] as? String {
            self.posterPath = posterPath
        }
        if let releaseDate = mappingObject["release_date"] as? String {
            self.releaseDate = releaseDate
        }
        if let title = mappingObject["title"] as? String {
            self.title = title
        }
        if let video = mappingObject["video"] as? Bool {
            self.video = video
        }
        if let voteAverage = mappingObject["vote_average"] as? Int {
            self.voteAverage = voteAverage
        }
        if let voteCount = mappingObject["vote_count"] as? Int {
            self.voteCount = voteCount
        }
    }
}
