//
//  URLBuilder.swift
//  MovieTheater
//
//  Created by Tran Hieu on 21/05/2023.
//

import Foundation

enum UrlBuilderError: Error {
    case invalidPath, invalidUrl
}

enum UrlBuilder {
    static func build(api: ApiConstructor) throws -> URL {
        guard var urlComponents = URLComponents(string: api.endpoint.fullPath) else {
            throw UrlBuilderError.invalidPath
        }
        urlComponents.queryItems = buildQueryParams(api.params, ["api_key": Constants.apiKey])
        guard let url = urlComponents.url else {
            throw UrlBuilderError.invalidUrl
        }
        return url
    }
    
    
    static func buildQueryParams(_ params: Parameters...) -> [URLQueryItem] {
        params.flatMap{$0}.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}




// https://api.themoviedb.org /3/genre/movie/list ?api_key=e00f0369ab2e8426b3afb4ba934a6eb3
// https://api.themoviedb.org/3/discover/movie?api_key=e00f0369ab2e8426b3afb4ba934a6eb3

