//
//  NetworkManager.swift
//  MovieDemo
//
//  Created by Irada Bakirli on 23.05.24.
//

import Foundation


class NetworkManager {
    static let shared = NetworkManager()
    
 
    
    func fetchMovies (completion: @escaping (Result <[MovieModel], Error>) -> Void) {
        URLSession.shared.fetch(url: "https://imdb-top-100-movies.p.rapidapi.com/") { (result:Result <[MovieModel], Error>) in
            completion(result)
        }
    }
    
    func fetchMovieDetails (completion: @escaping (Result <[MovieDetailsModel], Error>) -> Void) {
        URLSession.shared.fetch(url: "https://imdb-top-100-movies.p.rapidapi.com/top32") { (result:Result <[MovieDetailsModel], Error>) in
            completion(result)
        }
    }
}


extension URLSession {
    
    enum HTTPMethods: String {
        case GET = "GET"
        case PUT = "PUT"
        case POST = "POST"
        case OPTIONS = "OPTIONS"
    }

    enum NetworkError: Error {
        case invalidUrl
        case invalidData
    }
    
    
    func fetch<T:Codable> (url: String, method: HTTPMethods = .GET, completion: @escaping ((Result<T,Error>) -> Void )) {
        
        guard let url = URL(string: url) else {
            completion(.failure(NetworkError.invalidUrl))
            return
        }
        
        let headers = [
            "X-RapidAPI-Key": "125f88b6e6mshb912fb797775f8bp1d367cjsn1a00e707d06f",
            "X-RapidAPI-Host": "imdb-top-100-movies.p.rapidapi.com",
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        
        
        let task = dataTask(with: request) { data, _, error in
            guard let data = data else {
                if let error = error {

                    completion(.failure(error))
                } else {
                    completion(.failure(NetworkError.invalidData))
                }
                return
            }
//            let str = String(decoding: data, as: UTF8.self)
//            print(str)
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                print(data)
                completion(.success(result))
                
            } catch {
                completion(.failure(error))
                
            }
        }
        task.resume()
        
    }
}
