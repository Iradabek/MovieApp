//
//  SearchItemRow.swift
//  MovieDemo
//
//  Created by Irada Bakirli on 29.05.24.
//

import SwiftUI
import Kingfisher

struct SearchItemRow: View {
    var item: MovieModel
    
    var body: some View {

                    HStack {
                        if let imageUrl = URL(string: item.image ?? "") {
                            KFImage(imageUrl)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width - 32, height: 300)
                                .cornerRadius(10)
                        } else {
                            Image(systemName: "notFound")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 200)
                                .cornerRadius(10)
                                .foregroundColor(.gray)
                        }
                    }
                
                }
            }
   


struct SearchViewItemRow_Previews: PreviewProvider {
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
