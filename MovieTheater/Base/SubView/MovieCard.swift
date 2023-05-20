//
//  MovieCard.swift
//  MovieTheater
//
//  Created by Tran Hieu on 20/05/2023.
//

import SwiftUI

struct MovieCard: View {
    let movie: Movie
    var type: MovieType = .poster
    
    var itemWidth: CGFloat {
        screenWidth * type.widthPercent
    }
    var itemHeight: CGFloat {
        screenHeight * type.heightPercent
    }
    
    var body: some View {
        CustomImage(imageWidth: itemWidth, imageHeight: itemHeight, movie: movie)
    }

}



struct MovieCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieCard(movie: dev.movieInstance)
    }
}
