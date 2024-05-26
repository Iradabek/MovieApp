//
//  DetailsViewModel.swift
//  MovieDemo
//
//  Created by Irada Bakirli on 24.05.24.
//

import Foundation


class DetailsViewModel: ObservableObject {
    @Published var movieList: [MovieModel]
    
    init(movieList: [MovieModel]) {
        self.movieList = movieList
        Task {
            fetchMovieDetails()
        }
    }
    
            func fetchMovieDetails() {
                NetworkManager.shared.fetchMovieDetails { result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let data):
                            self.movieList = data
                        case .failure(let error):
                            print(error)
                        }
                    }
    
                }
            }
}
