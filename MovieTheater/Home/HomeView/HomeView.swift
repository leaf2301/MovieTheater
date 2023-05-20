//
//  HomeView.swift
//  MovieTheater
//
//  Created by Tran Hieu on 19/05/2023.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible()),]
    
    @StateObject var vm = HomeViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            LazyVStack(alignment: .leading, spacing: 20) {
                Text("What do you want to watch?")
                MovieSearchBar(txt: $searchText)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(vm.trendingMovies) {
                            MovieCard(movie: $0, type: .poster)
                        }
                    }
                }
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(vm.topRatedMovies) {
                        MovieCard(movie: $0, type: .grid)
                    }
                }
            }
            
          
            
           

        }
        .preferredColorScheme(.dark)
        .padding()
        .background(Color.AppBackgroundColor)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
