//
//  BourneDigitalTests.swift
//  BourneDigitalTests
//
//  Created by Sai Ankitha on 28/9/21.
//

@testable import BourneDigital
import XCTest

class BourneDigitalTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMovieArrayResponseWithWrongType() throws {
        let resp = Response(title: "Some", movies: [])
        let movieArray = NetworkManager().setData(resp: resp)
        XCTAssertEqual(movieArray, [])
    }
    func testMovieArrayResponseWithCorrectType() throws {
        let resp = Response(title: "Movies", movies: [Movie(title: "", imageHref: "", rating: 0, releaseDate: "")])
        let movieArray = NetworkManager().setData(resp: resp)
        XCTAssertNotEqual(movieArray, [])
    }
    func testApiIsSuccess() throws {
        NetworkManager().fetchMovies { result in
            switch result {
            case .success:
                XCTAssert(true)
            case .failure:
                XCTAssert(false)
            }
        }
    }
}
