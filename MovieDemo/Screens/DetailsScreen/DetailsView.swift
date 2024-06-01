//
//  DetailsView.swift
//  MovieDemo
//
//  Created by Irada Bakirli on 24.05.24.
//

import SwiftUI
import Kingfisher

struct DetailsView: View {
    @StateObject var viewModel: DetailsViewModel = DetailsViewModel()
    let movie: DetailsMovieModel
    
    var body: some View {
        
        ZStack {
            Color.black
                .ignoresSafeArea()
        ScrollView {
            
                VStack() {
                    
                    if let imageUrl = URL(string: movie.bigImage) {
                        KFImage(imageUrl)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width - 32, height: 400)
                            //.border(.customYellow, width: 2)
                            .cornerRadius(5)
                    } else {
                        Image(systemName: "notFound")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 200)
                            .cornerRadius(20)
                            .foregroundColor(.gray)
                    }
                    
                        Text(movie.title)
                            .font(.system(size: 18, weight: .bold, design: .serif))
                            .foregroundColor(.customYellow)
                            .multilineTextAlignment(.leading)
                            .padding(4)
                        
                        HStack {
                            Text(movie.id)
                            Text("Rating: \(movie.rating)")
                            Text("Year: \(movie.year)")
                        }
                        .font(.system(size: 14, weight: .semibold, design: .serif))
                        .foregroundColor(.white)
                        .padding(4)
                            
                    Text("Genre: \(movie.genre.joined(separator: ", "))")
                            .font(.system(size: 14, weight: .regular, design: .serif))
                            .foregroundColor(.white)
                            .padding(4)
                    
                    Text("Directors: \(movie.director.joined(separator: ", "))")
                            .font(.system(size: 14, weight: .regular, design: .serif))
                            .foregroundColor(.white)
                            .padding(4)
                    
                    Text("Writers: \(movie.writers.joined(separator: ", "))")
                            .font(.system(size: 14, weight: .regular, design: .serif))
                            .foregroundColor(.white)
                            .padding(4)
                        
                        Text(movie.description)
                            .font(.system(size: 14, weight: .regular, design: .serif))
                            .lineLimit(5)
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width - 32)
                    }
              }
        }
        .navigationTitle(movie.title)
        .foregroundColor(.red)
       // .navigationBarTitleDisplayMode(.inline)
        .onAppear {
             viewModel.fetchMovieDetails()
    }
  }
}


#Preview {
    DetailsView(viewModel: .init(), movie: DetailsMovieModel(
        rank: 1,
        title: "Sample Movie",
        thumbnail: "https://via.placeholder.com/150",
        rating: "5.0",
        id: "1",
        year: 2024,
        image: "https://via.placeholder.com/150",
        bigImage: "https://via.placeholder.com/300",
        description: "This is a sample movie description.",
        trailer: "",
        trailerEmbedLink: "https://www.youtube.com/embed/sample",
        trailerYoutubeID: "sample",
        genre: ["Action", "Adventure"],
        director: ["John Doe"],
        writers: ["Jane Doe"],
        imdbid: "tt1234567",
        imdbLink: "https://www.imdb.com/title/tt1234567/"
    ))
}

let variable = """
{


}
"""
