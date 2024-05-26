//
//  DetailsViewModel.swift
//  MovieDemo
//
//  Created by Irada Bakirli on 24.05.24.
//

import Foundation


class DetailsViewModel: ObservableObject {
    @Published var detailsList: [MovieDetailsModel]
    
    init(detailsList: [MovieDetailsModel]) {
        self.detailsList = detailsList
        Task {
            fetchMovieDetails()
        }
    }
    
            func fetchMovieDetails() {
                NetworkManager.shared.fetchMovieDetails { result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let data):
                            self.detailsList = data
                        case .failure(let error):
                            print(error)
                        }
                    }
    
                }
            }
}
