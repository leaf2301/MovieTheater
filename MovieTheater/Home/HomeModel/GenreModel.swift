//
//  GenreModel.swift
//  MovieTheater
//
//  Created by Tran Hieu on 21/05/2023.
//

import Foundation


struct GenreResponse: Codable {
    let genres: [Genre]
}

struct Genre: Codable, Identifiable {
    let id: Int
    let name: String
}
