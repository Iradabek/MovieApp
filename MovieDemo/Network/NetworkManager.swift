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
         "X-RapidAPI-Key": "8909d0e7b8msh3c21515fb8a5bb2p12ec7djsna88afce9f504",
         "X-RapidAPI-Host": "imdb-top-100-movies.p.rapidapi.com"
        ]



        /*
         let request = try httpRequestManager.makeRequest(urlString: urlString, method: method, headers: headers)
         return try await httpRequestManager.performRequest(request)
         */
        return try await httpRequestManager.performRequest(urlString: urlString, method: method, headers: headers)
    }
    
}
