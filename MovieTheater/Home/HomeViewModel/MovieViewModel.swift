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
    
    @Published var genre: [Genre] = []
    @Published var selectedGenre = DeveloperPreview.instance.genreInstance
    
    @Published var moviesForSelectedGenre: [Movie] = []
    
    private let service = MovieService()
    
    init() {
        Task {
            await fetchTrendingMovie()
            await fetchTopRatedMovie()
            await fetchGenre()
            await fetchMoviesForSelectedGenre()
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
    
    func fetchGenre() async {
        do {
            let getGenre: GenreResponse = try await service.fetchData(api: ApiConstructor(endpoint: .genre))
            self.genre = getGenre.genres
            
//            if let genre = genre.first {
//                selectedGenre = genre
//            }
        } catch {
            self.errorMsg = "error: \(error)"
        }
    }

    func fetchMoviesForSelectedGenre() async {
        do {
            let api = ApiConstructor(endpoint: .discoverMovies, params: [
                "with_genres": "\(selectedGenre.id)"
            ])
            let response: MovieResponse = try await service.fetchData(api: api)
            self.moviesForSelectedGenre = response.results
        } catch  {
            self.errorMsg = "error: \(error)"
        }

    }
    

    
    

}
