//
//  DetailsView.swift
//  MovieDemo
//
//  Created by Irada Bakirli on 24.05.24.
//

import SwiftUI
import Kingfisher

struct DetailsView: View {
    @StateObject var viewModel: HomeViewModel = HomeViewModel(movieList: [])
    let movie: MovieModel
    
    var body: some View {
        
        ScrollView {
            
            VStack() {
                
                if let imageUrl = URL(string: movie.image ?? " ") {
                    KFImage(imageUrl)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 200)
                        .border(.customYellow, width: 2)
                        .cornerRadius(10)
                } else {
                    Image(systemName: "notFound")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .cornerRadius(10)
                        .foregroundColor(.gray)
                }
                
                    Text(movie.title)
                        .font(.system(size: 18, weight: .bold, design: .serif))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .padding(4)
                    
                    HStack {
                        Text(movie.id)
                        Text("Rating: \(movie.rating)")
                        Text("Year: \(movie.year)")
                    }
                    .font(.system(size: 14, weight: .semibold, design: .serif))
                    .foregroundColor(.customYellow)
                    .padding(4)
                        
                Text("Genre: \(movie.genre.joined(separator: ", "))")
                        .font(.system(size: 14, weight: .regular, design: .serif))
                        .foregroundColor(.customYellow)
                        .padding(4)
                
                Text("Directors: \(movie.director?.joined(separator: ", ") ?? "Jane Doe")")
                        .font(.system(size: 14, weight: .regular, design: .serif))
                        .foregroundColor(.customYellow)
                        .padding(4)
                
                Text("Writers: \(movie.writers?.joined(separator: ", ") ?? "John Doe")")
                        .font(.system(size: 14, weight: .regular, design: .serif))
                        .foregroundColor(.customYellow)
                        .padding(4)
                    
                    Text(movie.description)
                        .font(.system(size: 14, weight: .regular, design: .serif))
                        .lineLimit(5)
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 32)
                }
            }
        .background(Color.black)
        .navigationTitle(movie.title)
        .foregroundColor(.white)
        
        }
    }


#Preview {
    DetailsView(viewModel: .init(movieList: []), movie: MovieModel(
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
