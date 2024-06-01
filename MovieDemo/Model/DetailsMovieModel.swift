//
//  DetailsMovieModel.swift
//  MovieDemo
//
//  Created by Irada Bakirli on 29.05.24.
//

import Foundation

struct DetailsMovieModel: Codable, Identifiable {
    let rank: Int
    let title: String
    let thumbnail: String
    let rating, id: String
    let year: Int
    let image, bigImage: String
    let description: String
    let trailer, trailerEmbedLink: String
    let trailerYoutubeID: String
    let genre, director, writers: [String]
    let imdbid: String
    let imdbLink: String

    enum CodingKeys: String, CodingKey {
        case rank, title, thumbnail, rating, id, year, image
        case bigImage = "big_image"
        case description, trailer
        case trailerEmbedLink = "trailer_embed_link"
        case trailerYoutubeID = "trailer_youtube_id"
        case genre, director, writers, imdbid
        case imdbLink = "imdb_link"
    }
}

extension DetailsMovieModel {
    public init(_ model: MovieModel) {
        self.init(rank: model.rank,
                  title: model.title,
                  thumbnail: model.thumbnail ?? "",
                  rating: model.rating,
                  id: model.id,
                  year: model.year,
                  image: model.image ?? "",
                  bigImage: model.bigImage ?? "",
                  description: model.description,
                  trailer: model.trailer ?? "",
                  trailerEmbedLink: model.trailerEmbedLink ?? "",
                  trailerYoutubeID: model.trailerYoutubeID ?? "",
                  genre: model.genre,
                  director: model.director ?? [],
                  writers: model.writers ?? [],
                  imdbid: model.imdbid,
                  imdbLink: model.imdbLink ?? "")
    }
}
