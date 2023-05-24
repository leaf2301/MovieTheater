//
//  TypeMovieCard.swift
//  MovieTheater
//
//  Created by Tran Hieu on 20/05/2023.
//

import Foundation


enum MovieType {
    case poster, grid
    
    var widthPercent: Double {
        switch self {
        case .poster:
            return 0.45
        case .grid:
            return 0.3
        }
    }
    
    var heightPercent: Double {
        switch self {
        case .poster:
            return 0.26
        case .grid:
            return 0.15
        }
    }
}



