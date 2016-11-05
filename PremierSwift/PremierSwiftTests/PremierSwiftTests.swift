import XCTest
@testable import PremierSwift

class PremierSwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMapJSON() {
        
        if let jsonPath = Bundle(for: PremierSwiftTests.self).path(forResource: "Movies", ofType: "json") {
            do {
                let contents = try String(contentsOfFile: jsonPath)
                
                if let data = contents.data(using: .utf8) {
                    let JSON = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
                    
                    if let moviesArray = JSON["results"] as? [AnyObject] {
                        let movie = Movie()
                        let parsedMoviesArray = movie.mapArray(mappingArray: moviesArray)
                        XCTAssert(parsedMoviesArray.count == moviesArray.count, "Parsed objects count should match array objects count")
                    } else {
                        XCTFail("JSON results has an unexpected type")
                    }
                } else {
                    XCTFail("Cannot convert String to Data")
                }
            } catch {
                XCTFail("JSON format is not valid")
            }
        } else {
            XCTFail("Cannot find file")
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
