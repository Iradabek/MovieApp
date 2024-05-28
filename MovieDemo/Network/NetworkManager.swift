//
//  NetworkManager.swift
//  MovieDemo
//
//  Created by Irada Bakirli on 23.05.24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let httpRequestManager = HttpRequestManager()
    
    func fetchData<T: Decodable>(from endpoint: Endpoints, method: HTTPmethods = .GET) async throws -> T {
        let urlString = endpoint.rawValue
        let headers = [
            "X-RapidAPI-Key": "34ee431303msh80a812eef1a2ff8p1f32b1jsn8bd871dec5af",
            "X-RapidAPI-Host": "imdb-top-100-movies.p.rapidapi.com"
        ]
        
        let request = try httpRequestManager.makeRequest(urlString: urlString, method: method, headers: headers)
        return try await httpRequestManager.performRequest(request)
    }
    
}
    
