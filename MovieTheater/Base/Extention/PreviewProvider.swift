//
//  PreviewProvider.swift
//  MovieTheater
//
//  Created by Tran Hieu on 19/05/2023.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() {}
    
    let movieInstance = Movie(posterPath: "/c01Y4suApJ1Wic2xLmaq1QYcfoZ.jpg",
                                     adult: false,
                                     overview: "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
                                     releaseDate: "1972-03-15",
                                     genreIDS: [80, 18],
                                     id: 238,
                                     originalTitle: "The Godfather",
                                     originalLanguage: "en",
                                     title: "The Godfather",
                                     backdropPath: "/7VrRna8S3x6xbijooeBmxqvHXiu.jpg",
                                     popularity: 43.457,
                                     voteCount: 12278,
                                     video: false,
                                     voteAverage: 8.7)

}
