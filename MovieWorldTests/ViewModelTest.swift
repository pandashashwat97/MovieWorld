//
//  ViewModelTest.swift
//  MovieWorldTests
//
//  Created by Shashwat Panda on 10/05/24.
//

import XCTest
import Foundation
@testable import MovieWorld

final class ViewModelTest: XCTestCase {
    
    var vm: ViewModel!
    override func setUp() {
        super.setUp()
        vm = ViewModel()
    }
    override func tearDown() {
        vm = nil
        super.tearDown()
    }
    // Test network call
    func testLData() {
        vm.lData(endPoints: "") { data in
            XCTAssertNotNil(data)
        }
    }
    // formatDateToYear()
    func testFormatDateToYear() {
        let formattedDate = vm.formatDateToYear(releaseDate: "2024-01-01")
        let expectedreturn = "2024"
        // Checking function
        XCTAssertEqual(formattedDate, expectedreturn)
    }
    // formatDateMedium()
    func testFormatDateMedium() {
        let formattedDate = vm.formatDateMedium(releaseDate: "2024-01-01")
        let expectedreturn = "Jan 1, 2024"
        // Checking function
        XCTAssertEqual(formattedDate, expectedreturn)
    }
    // genreString()
    func testGenreString() {
        let genreGroupString = vm.genreString(genreId: [28, 12, 16])
        // Checking function
        XCTAssertNotNil(genreGroupString)
    }
    // ratingsPercentage()
    func testRatingsPercentage() {
        let ratings = vm.ratingsPercentage(ratings: 6.5)
        let expectedreturn = 65
        // Checking function
        XCTAssertEqual(ratings, expectedreturn)
    }
    // ratingsDouble()
    func testRatingsDouble() {
        let ratings = vm.ratingsDouble(ratings: 65)
        let expectedreturn = CGFloat(0.65)
        // Checking function
        XCTAssertEqual(ratings, expectedreturn)
    }
}
