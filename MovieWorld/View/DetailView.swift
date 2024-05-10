//
//  DetailView.swift
//  MovieWorld
//
//  Created by Shashwat Panda on 08/05/24.
//

import SwiftUI
import Foundation

struct DetailView: View {
    var vm: ViewModel
    var movieDetails: Result
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading) {
                ZStack(alignment: .bottomTrailing){
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movieDetails.poster_path)")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 5)
                                    .foregroundStyle(Color.black)
                            )
                            .frame(maxWidth: UIScreen.main.bounds.width - 40)
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.gray)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .frame(maxWidth: UIScreen.main.bounds.width - 40)
                    RatingsView(vm: vm, ratingsPercentage: vm.ratingsPercentage(ratings: movieDetails.vote_average))
                }
                .padding(.top, -30)
                .padding(.bottom, 20)
                Text("\(movieDetails.title) (\(vm.formatDateToYear(releaseDate: movieDetails.release_date) ?? "NA"))")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color.cyan)
                Text("( \(movieDetails.release_date) )  .  \(vm.genreString(genreId: movieDetails.genre_ids))")
                    .padding(.bottom, 10)
                Text("Overview")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(Color.red)
                Text(movieDetails.overview)
            }
            .padding(.horizontal, 20)
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    DetailView(vm: ViewModel(), movieDetails: Result(adult: false,
                                     genre_ids: [
                                        878,
                                        27,
                                        28
                                     ],
                                     id: 940721,
                                     original_language: "ja",
                                     original_title: "ゴジラ-1.0",
                                     overview: "Postwar Japan is at its lowest point when a new crisis emerges in the form of a giant monster, baptized in the horrific power of the atomic bomb.",
                                     popularity: 2792.371,
                                     poster_path: "/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg",
                                     release_date: "2023-11-03",
                                     title: "Godzilla Minus One",
                                     video: false,
                                     vote_average: 7.829,
                                                      vote_count: 772))
}

