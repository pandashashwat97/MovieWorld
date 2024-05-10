//
//  ListView.swift
//  MovieWorld
//
//  Created by Shashwat Panda on 07/05/24.
//

import SwiftUI

struct ListView: View {
    var vm: ViewModel
    @Binding var movies: Movies?
    var title:String = ""
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading){
                    ForEach(movies?.results ?? [], id: \.id){
                        result in
                        NavigationLink(value: result) {
                            RowView(imageUrlEndpoint: result.poster_path, title: result.title, releaseDate: vm.formatDateMedium(releaseDate: result.release_date) ?? result.release_date, ratings: vm.ratingsPercentage(ratings: result.vote_average))
                        }
                    }
                }
            }
            .navigationTitle(title)
            .navigationDestination(for: Result.self) { result in
                DetailView(vm: vm, movieDetails: result)
            }
        }
    }
}
