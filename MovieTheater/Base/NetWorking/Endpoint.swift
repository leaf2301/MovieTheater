//
//  Endpoint.swift
//  MovieTheater
//
//  Created by Tran Hieu on 21/05/2023.
//

import Foundation

enum Endpoint {
    case trending, topRated, movieReviews(_ movieId: Int), genre
    case discoverMovies
    
    
    
    private var path: String {
        switch self {
        case .trending:
            return "/3/trending/movie/week"
        case .topRated:
            return "/3/movie/top_rated"
        case .movieReviews(let movieId):
            return "/3/movie/\(movieId)reviews"
        case .genre:
            return "/3/genre/movie/list"
        case .discoverMovies:
            return "/3/discover/movie"
        }
    }
    
    var fullPath: String {
        Constants.baseUrl + path
    }
}


