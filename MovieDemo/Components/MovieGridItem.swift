//
//  MovieGridItem.swift
//  MovieDemo
//
//  Created by Irada Bakirli on 29.05.24.
//

import SwiftUI
import Kingfisher

struct MovieGridItem: View {
    var item: MovieModel
    
    var body: some View {
        VStack {
            KFImage(URL(string: item.image ?? ""))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 150)
                .cornerRadius(8)
            
            Text(item.title)
                .font(.caption)
                .bold()
                .multilineTextAlignment(.center)
                .foregroundColor(.black.opacity(0.7))
        }
    }
}

struct MovieGridItem_Previews: PreviewProvider {
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
