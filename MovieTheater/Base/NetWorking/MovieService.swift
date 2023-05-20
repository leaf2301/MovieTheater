//
//  MovieService.swift
//  MovieTheater
//
//  Created by Tran Hieu on 21/05/2023.
//

import Foundation

enum MovieServiceError: Error {
    case invalidResponse, invalidUrl
}

actor MovieService {
    func fetchData<T: Codable>(api: ApiConstructor) async throws -> T {
        guard let url = try? UrlBuilder.build(api: api) else {
            print("Error URL")
            throw MovieServiceError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
            print("Bad response")
            throw MovieServiceError.invalidResponse
        }
        
        return try JSONDecoder().decode(T.self, from: data)
        
    }
    
}
