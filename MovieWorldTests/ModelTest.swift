//
//  ModelTest.swift
//
//  Created by Shashwat Panda on 10/05/24.
//

import XCTest
@testable import MovieWorld

final class ModelTest: XCTestCase {
    // Test Model Initialisation
    func testMovie() {
        // Dummy Values
        let movieModel = Movies(results: [Result(adult: false, genre_ids: [1, 2, 3], id: 1, original_language: "en", original_title: "ABC", overview: "Good", popularity: 76.987, poster_path: "abc.jpg", release_date: "2024-01-01", title: "ABC", video: true, vote_average: 7.6, vote_count: 12345)])

        // Test Initialisation
        XCTAssertFalse(movieModel.results[0].adult)
        XCTAssertEqual(movieModel.results[0].genre_ids, [1, 2, 3])
        XCTAssertEqual(movieModel.results[0].id, 1)
        XCTAssertEqual(movieModel.results[0].original_language, "en")
        XCTAssertEqual(movieModel.results[0].original_title, "ABC")
        XCTAssertEqual(movieModel.results[0].overview, "Good")
        XCTAssertEqual(movieModel.results[0].popularity, 76.987)
        XCTAssertEqual(movieModel.results[0].poster_path, "abc.jpg")
        XCTAssertEqual(movieModel.results[0].release_date, "2024-01-01")
        XCTAssertEqual(movieModel.results[0].title, "ABC")
        XCTAssertTrue(movieModel.results[0].video)
        XCTAssertEqual(movieModel.results[0].vote_average, 7.6)
        XCTAssertEqual(movieModel.results[0].vote_count, 12345)
    }
}
