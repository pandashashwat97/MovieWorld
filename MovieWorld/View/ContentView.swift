//
//  ContentView.swift
//  MovieWorld
//
//  Created by Shashwat Panda on 07/05/24.
//

import SwiftUI

enum MovieURL:String {
    case current = "https://api.themoviedb.org/3/movie/now_playing?api_key=909594533c98883408adef5d56143539"
    case popular = "https://api.themoviedb.org/3/movie/popular?api_key=909594533c98883408adef5d56143539"
}

struct ContentView: View {
    var cvm = ViewModel()
    var pvm = ViewModel()
    @State var currentMovies: Movies?
    @State var popularMovies: Movies?
    var body: some View {
        TabView{
            ListView(vm: cvm, movies: $currentMovies, title: "Current Movies")
                .tabItem {
                    Image(systemName: "clock.badge.checkmark")
                    Text("Current")
                }
            ListView(vm: pvm, movies: $popularMovies, title: "Popular Movies")
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Popular")
                }
        }
        .task {
            cvm.lData(endPoints: MovieURL.current.rawValue) { cmovies in
                currentMovies = cmovies
            }
            pvm.lData(endPoints: MovieURL.popular.rawValue) { pmovies in
                popularMovies = pmovies
            }
        }
    }
}

