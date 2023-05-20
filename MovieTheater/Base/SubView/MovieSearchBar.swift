//
//  MovieSearchBar.swift
//  MovieTheater
//
//  Created by Tran Hieu on 19/05/2023.
//

import SwiftUI

struct MovieSearchBar: View {
    //let movie: Movie
    @Binding var txt: String
    
    var body: some View {
        TextField("Search", text: $txt)
            .overlay(
                ZStack {
                    Image.SearchIcon
                        .opacity(txt.isEmpty ? 1 : 0)
                    
                    Image.CancelIcon
                        .foregroundColor(.white)
                        .opacity(txt.isEmpty ? 0 : 1)
                        .onTapGesture {
                            txt = ""
                        }
                }
                , alignment: .trailing
            )
            .foregroundColor(.white)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(Color.AppGrayColor1)
            )            
    }
}

struct MovieSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchBar(txt: .constant("as"))
            .preferredColorScheme(.dark)
    }
}
