//
//  ViewModel.swift
//  MovieWorld
//
//  Created by Shashwat Panda on 07/05/24.
//

import Foundation
import NetworkManager

final class ViewModel {
    // Decoding data into desired Model
    var networkManager = NetworkManager()
    func lData(endPoints: String, completion: @escaping (Movies)->Void){

        networkManager.getData(link: endPoints, completion: {
            data in
            let decoder = JSONDecoder()
            do{
                let object = try decoder.decode(Movies.self ,from: data)
                completion(object)
            } catch{
                print(error)
            }
        })
    }
    // Extract Year from String date
    func formatDateToYear(releaseDate: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: releaseDate)!
        dateFormatter.dateFormat = "yyyy"
        let yearString = dateFormatter.string(from: date)
        return yearString
    }
    // Extract Year from String date
    func formatDateMedium(releaseDate: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: releaseDate)!
        dateFormatter.dateStyle = .medium
        let yearString = dateFormatter.string(from: date)
        return yearString
    }
    // Return Genre
    func genreString(genreId: [Int]) -> String {
        var genre: Set<String> = []
        for i in 0..<genreId.count {
            switch genreId[i] {
            case 28:
                genre.insert("Action")
            case 12:
                genre.insert("Adventure")
            case 16:
                genre.insert("Animation")
            case 35:
                genre.insert("Comedy")
            case 80:
                genre.insert("Crime")
            case 99:
                genre.insert("Documentary")
            case 18:
                genre.insert("Drama")
            case 10751:
                genre.insert("Family")
            case 14:
                genre.insert("Fantasy")
            case 36:
                genre.insert("History")
            case 27:
                genre.insert("Horror")
            case 10402:
                genre.insert("Music")
            case 9648:
                genre.insert("Mystery")
            case 10749:
                genre.insert("Romance")
            case 878:
                genre.insert("Science Fiction")
            case 10770:
                genre.insert("TV Movie")
            case 53:
                genre.insert("Thriller")
            case 10752:
                genre.insert("War")
            case 37:
                genre.insert("Western")
            default:
                genre.insert("NA")
            }
        }
        return genre.joined(separator: ", ")
    }
    // Ratings in percentage
    func ratingsPercentage(ratings:Double) -> Int {
        return Int(round(ratings*10))
    }
    // Ratings in Double till 2 decimal places
    func ratingsDouble(ratings: Int) -> CGFloat {
        return CGFloat(Double(ratings)/100)
    }
}
