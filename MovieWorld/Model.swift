//
//  Model.swift
//  MovieWorld
//
//  Created by Shashwat Panda on 07/05/24.
//

import Foundation

struct Movies: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable, Identifiable, Hashable {
    let adult: Bool
    let genre_ids: [Int]
    let id: Int
    let original_language: String
    let original_title, overview: String
    let popularity: Double
    let poster_path, release_date, title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
}

