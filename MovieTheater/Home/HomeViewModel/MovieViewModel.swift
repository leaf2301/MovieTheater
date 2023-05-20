//
//  MovieViewModel.swift
//  MovieTheater
//
//  Created by Tran Hieu on 19/05/2023.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    @Published var trendingMovies: [Movie] = []
    @Published var topRatedMovies: [Movie] = []
    @Published var errorMsg: String = ""
    
    private let service = MovieService()
    
    init() {
        Task {
            await fetchTrendingMovie()
            await fetchTopRatedMovie()
        }
    }
    
    func fetchTrendingMovie() async {
        do {
            let getMovie: MovieResponse = try await service.fetchData(api: ApiConstructor(endpoint: .trending))
            self.trendingMovies = getMovie.results
        } catch {
            self.errorMsg = "error: \(error)"
        }
    }
    func fetchTopRatedMovie() async {
        do {
            let getMovie: MovieResponse = try await service.fetchData(api: ApiConstructor(endpoint: .topRated))
            self.topRatedMovies = getMovie.results
        } catch {
            self.errorMsg = "error: \(error)"
        }
    }

}
