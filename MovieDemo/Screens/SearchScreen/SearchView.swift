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

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.filteredMovies) { item in
                    NavigationLink(destination: DetailsView(movie: item)) {
                        SearchItemRow(item: item)
                    }
                    .listRowSeparator(.hidden,
                                      edges: .all)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Find the Movie")
            .searchable(text: $viewModel.searchText)
            
            .onChange(of: viewModel.searchText) { _ in
                viewModel.fetchFilteredMovies()
            }
            .onAppear {
                viewModel.fetchMovies()
            }        }
    }
}

#Preview {
    SearchView()
}
