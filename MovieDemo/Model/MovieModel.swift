//
//  MovieDetailsModel.swift
//  MovieDemo
//
//  Created by Irada Bakirli on 24.05.24.
//

import Foundation

struct MovieModel: Codable, Identifiable {
    let rank: Int
    let title: String
    let thumbnail: String?
    let rating, id: String
    let year: Int
    let image, bigImage: String?
    let description: String
    let trailer: String?
    let trailerEmbedLink: String?
    let trailerYoutubeID: String?
    let genre: [String]
    let director, writers: [String]?
    let imdbid: String
    let imdbLink: String?

    enum CodingKeys: String, CodingKey {
        case rank, title, thumbnail, rating, year, id, image
        case bigImage = "big_image"
        case description, trailer,imdbid
        case trailerEmbedLink = "trailer_embed_link"
        case trailerYoutubeID = "trailer_youtube_id"
        case director, writers
        case genre
        case imdbLink = "imdb_link"
    }
}
