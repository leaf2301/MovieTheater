//
//  DetailModel.swift
//  MovieTheater
//
//  Created by Tran Hieu on 24/05/2023.
//

import Foundation

struct ReviewResponse: Codable {
    let id, page: Int
    let results: [Review]
    let totalPages, totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case id, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct Review: Codable, Identifiable{
    let author: String
    let authorDetails: AuthorDetails?
    let content, createAt, id, updateAt: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case author
        case authorDetails = "author_details"
        case content
        case createAt = "created_at"
        case id
        case updateAt = "updated_at"
        case url
    }
}

struct AuthorDetails: Codable {
    let name, username: String
    let avatarPath: String?
    let rating: Int?
    
    enum CodingKeys: String, CodingKey {
        case name, username
        case avatarPath = "avatar_path"
        case rating
    }
}

extension Review {
    var authorName: String {
        authorDetails?.authorName ?? author
    }
    
    var authorImage: String {
        var image = authorDetails?.avatarPath ?? ""
        if image.starts(with: "/") {
            image = String(image.dropFirst())
            
        }
        return image
        
    }
}

extension AuthorDetails {
    var authorName: String {
        name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? username : name
    }
}
