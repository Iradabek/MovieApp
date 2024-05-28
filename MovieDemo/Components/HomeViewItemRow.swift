//
//  HomeViewItemRow.swift
//  MovieDemo
//
//  Created by Irada Bakirli on 27.05.24.
//

import SwiftUI
import Kingfisher

struct HomeViewItemRow: View {
    let item: MovieModel
    
    var body: some View {
            
            HStack() {
                if let imageUrl = URL(string: item.image ?? "") {
                    KFImage(imageUrl)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .cornerRadius(10)
                } else {
                    Image(systemName: "notFound")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .cornerRadius(10)
                        .foregroundColor(.gray)
                }
                
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.system(size: 18, weight: .bold, design: .serif))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    Spacer()
                        .frame(height:2)
                    
                    HStack {
                        Text(item.rating)
                        Text(item.id)
                        Text("\(item.year)")
                    }
                    .font(.system(size: 14, weight: .bold, design: .serif))
                    .foregroundColor(.customYellow)
                    
                    Spacer()
                        .frame(height:3)
                    
                    Text("Genre: \(item.genre.joined(separator: ", "))")
                        .font(.system(size: 14, weight: .bold, design: .serif))
                        .foregroundColor(.customYellow)
                    
                    Spacer()
                        .frame(height:3)
                    
                    Text(item.description)
                        .font(.system(size: 14, weight: .regular, design: .serif))
                        .lineLimit(5)
                        .foregroundColor(.black)
                }
            }
    }
}


struct HomeViewItemRow_Previews: PreviewProvider {
    static var previews: some View {
        let _ = MovieModel (
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
        )
    }
}
