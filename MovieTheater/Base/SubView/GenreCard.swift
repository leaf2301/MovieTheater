//
//  GenreCard.swift
//  MovieTheater
//
//  Created by Tran Hieu on 21/05/2023.
//

import SwiftUI

struct GenreCard: View {
    let genre: Genre
    let namespace: Namespace.ID
    @Binding var selectedGenre: Genre
    
    var body: some View {
        Text(genre.name)
            .bold()
            .background(
                ZStack(alignment: .bottom) {
                    if selectedGenre.id == genre.id {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.AppGrayColor1)
                            .frame(height: 3)
                            .offset(y: 20)
                            .matchedGeometryEffect(id: "gen", in: namespace)
                        
                    }
                    
                }
            )
            .padding()
    }
}

struct GenreCard_Previews: PreviewProvider {
    static var previews: some View {
        GenreCard(genre: dev.genreInstance, namespace: Namespace().wrappedValue, selectedGenre: .constant(dev.genreInstance))
    }
}
