//
//  HomeViewModel.swift
//  MovieDemo
//
//  Created by Irada Bakirli on 24.05.24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var movieList: [MovieModel] = []
    private let networkService: NetworkManager
    
    init(networkService: NetworkManager = NetworkManager.shared) {
        self.networkService = networkService
    }
    
    func fetchMovies()  {
        Task {
            do {
                let fetchedMovies:[MovieModel] = try await networkService.fetchData(from: .movieEndpoint)
                DispatchQueue.main.async {
                    self.movieList = fetchedMovies
                }
            } catch {
                print("Failed to fetch movies: \(error)")
            }
        }
    }
}

