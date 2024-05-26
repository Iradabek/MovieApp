//
//  HomeViewModel.swift
//  MovieDemo
//
//  Created by Irada Bakirli on 24.05.24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var movieList: [MovieModel]
    
    init(movieList: [MovieModel]) {
        self.movieList = movieList
        
        Task {
            fetchMovies()
        }
    }
    
            func fetchMovies() {
                NetworkManager.shared.fetchMovies { result in
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





