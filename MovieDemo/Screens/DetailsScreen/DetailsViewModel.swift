//
//  DetailsViewModel.swift
//  MovieDemo
//
//  Created by Irada Bakirli on 24.05.24.
//

import Foundation

    class DetailsViewModel: ObservableObject {
        @Published var movieList: [MovieModel] = []
        private let networkService: NetworkManager
        
        init(networkService: NetworkManager = NetworkManager.shared) {
            self.networkService = networkService
        }
        
        
        
        func fetchMovieDetails() {
            Task {
                do {
                    let fetchedMovieDetails:[MovieModel] = try await networkService.fetchData(from: .detailsEndpoint)
                    DispatchQueue.main.async {
                        self.movieList = fetchedMovieDetails
                    }
                } catch {
                    print("Failed to fetch movies: \(error)")
                }
            }
        }
    }
