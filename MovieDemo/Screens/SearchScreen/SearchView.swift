//
//  SearchView.swift
//  MovieDemo
//
//  Created by Irada Bakirli on 27.05.24.
//

import SwiftUI
import Kingfisher

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()
    let columns = Array(repeating: GridItem(.flexible(minimum: 120)), count: 3)
    
    var body: some View {
        
        NavigationView {
             ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.filteredMovies) { item in
                        NavigationLink(destination: DetailsView(movie: .init(item))) {
                            MovieGridItem(item: item)
                            
                        }
                    }
                    
                }
                .padding()
            }
            .navigationTitle("Find the Movie")
            .searchable(text: $viewModel.searchText)
            .onChange(of: viewModel.searchText) { _ in
                viewModel.fetchFilteredMovies()
            }
            .onAppear {
                viewModel.fetchMovies() }
        }
    }
}
        

#Preview {
    SearchView()
}
