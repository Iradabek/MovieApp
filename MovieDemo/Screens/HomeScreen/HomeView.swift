//
//  ContentView.swift
//  MovieDemo
//
//  Created by Irada Bakirli on 23.05.24.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                List {
                    ForEach(viewModel.movieList) { item in
                        NavigationLink(destination: DetailsView(movie: DetailsMovieModel(item))) {
                            HomeViewItemRow(item: item)
                                .padding()
                                .cornerRadius(10)
                        }
                        .listRowBackground(Color.clear)
                    }
                }
                .background(Color.white)
                .navigationTitle("Discover")
                .listStyle(PlainListStyle())
               // .foregroundColor(.white)
            }
        }
        .onAppear {
            viewModel.fetchMovies()
        }
    }
}

#Preview {
    HomeView(viewModel: .init())
}


