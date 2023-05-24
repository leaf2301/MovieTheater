//
//  CustomImage.swift
//  MovieTheater
//
//  Created by Tran Hieu on 20/05/2023.
//

import SwiftUI

struct CustomImage: View {
    let imageWidth: CGFloat
    let imageHeight: CGFloat
    
    let movie: Movie
    
    var imageType: MovieImageType = .poster
    
    var body: some View {
        AsyncImage(url: URL(string: movie.getImage(for: imageType))) { image in
            image
                .resizable()
                .scaledToFill()
                
        } placeholder: {
            ZStack {
                Color.AppGrayColor1
                VStack {
                    ProgressView()
                        .tint(.white)
                    Text(movie.title)
                }
                .padding()
            }
        }
        .frame(width: imageWidth, height: imageHeight)
        .clipShape(RoundedRectangle(cornerRadius: 20))

    }
}

struct CustomImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomImage(imageWidth: 150, imageHeight: 150, movie: dev.movieInstance)
    }
}
