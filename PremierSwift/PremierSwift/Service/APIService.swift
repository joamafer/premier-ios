import UIKit

public typealias BeforeLoad = () -> ()
public typealias AfterLoad = () -> ()
public typealias Success = (_ response: [AnyObject]) -> ()
public typealias Failure = (_ error: NSError?) -> ()

class APIService: NSObject {
    static let sharedInstance = APIService()
    
    // MARK: - Fetch
    
    class func fetch(beforeLoad: BeforeLoad, afterLoad: @escaping AfterLoad, success: @escaping Success, failure: @escaping Failure) {
        
        guard let moviesURL = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=e4f9e61f6ffd66639d33d3dde7e3159b") else {
            
            failure(NSError.create(localizedDescription: "The service is unavailable"))
            
            return
        }
        
        beforeLoad()
        
        URLSession.shared.dataTask(with: moviesURL) { (responseData, _, _) in
            
            afterLoad()
            
            if let data = responseData {
                
                do {
                    let JSON = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
                        
                    if let moviesArray = JSON["results"] as? [AnyObject] {
                        success(moviesArray)
                    } else {
                        failure(NSError.create(localizedDescription: "Error when parsing the data received"))
                    }
                    
                } catch let error as NSError {
                    failure(error)
                }
                
            } else {
                failure(NSError.create(localizedDescription: "Error with the data received from server"))
            }
            
        }.resume()
        
    }
}

extension NSError {
    class func create(domain: String = "deliveroo.PremierSwift", code: Int = 999, localizedDescription: String) -> NSError {
        
        return NSError(domain: domain, code: code, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString(localizedDescription, comment: localizedDescription)])
    }
}
