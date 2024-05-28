//
//  HTTPRequestManager.swift
//  MovieDemo
//
//  Created by Irada Bakirli on 28.05.24.
//

import Foundation

class HttpRequestManager {
    
    func makeRequest(urlString: String, method: HTTPmethods, headers: [String: String]?) throws -> URLRequest {
        guard let url = URL(string: urlString) else {
            print("invalidURl")
            throw NetworkError.invalidUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        if let headers = headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        return request
    }
    
    func performRequest<T: Decodable>(_ request: URLRequest) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            print("invalidResponse")
            throw NetworkError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            print("invalidData")
            throw NetworkError.invalidData
        }
    }
}
