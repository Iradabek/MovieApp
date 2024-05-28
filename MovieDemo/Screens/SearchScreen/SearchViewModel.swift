//
//  SearchViewModel.swift
//  MovieDemo
//
//  Created by Irada Bakirli on 28.05.24.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var movieList: [MovieModel] = []
      @Published var searchText: String = "" {
          didSet {
              if searchText.isEmpty {
                  DispatchQueue.main.async {
                      self.fetchMovies()
                  }
              }
          }
      }
    
    var filteredMovies: [MovieModel] {
          guard !searchText.isEmpty else { return movieList }
          return movieList.filter { movie in
              movie.title.lowercased().contains(searchText.lowercased())
          }
      }
    
    private var networkManager = NetworkManager()
    
    init(networkManager: NetworkManager = NetworkManager.shared) {
        self.networkManager = networkManager
        fetchMovies()
    }
    
   
        
        func fetchMovies() {
            Task {
                do {
                    let movies:[MovieModel] = try await networkManager.fetchData(from: .movieEndpoint)
                    DispatchQueue.main.async {
                        self.movieList = movies }
                } catch {
                    print("Error fetching movies: \(error)")
                }
            }
        }
        
        func fetchFilteredMovies() {
            DispatchQueue.main.async {
                self.movieList = self.filteredMovies
            }
        }
    }



