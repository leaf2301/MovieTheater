//
//  DetailViewModel.swift
//  MovieTheater
//
//  Created by Tran Hieu on 24/05/2023.
//

import Foundation

@MainActor
class DetailViewModel: ObservableObject {
    let movie: Movie
    let selection: [DetailViewSection] = [.about, .review]
    @Published var selectedSection: DetailViewSection = .about
    
    @Published var reviews: [Review] = []
    @Published var errorMsg = ""
    private let movieService = MovieService()
    
    init(movie: Movie) {
        self.movie = movie
        Task {
            await fetchReview()
        }
    }
    
    func fetchReview() async {
        do {
            let response: ReviewResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .movieReviews(movie.id)))
            self.reviews = response.results
        } catch {
            print("error: \(error)")
            errorMsg = ("error: \(error)")

        }
    }
}
