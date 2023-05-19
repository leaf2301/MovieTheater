//
//  HomeView.swift
//  MovieTheater
//
//  Created by Tran Hieu on 19/05/2023.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
        
    var body: some View {
        ScrollView(showsIndicators: false) {
            Text("What do you want to watch?")
            MovieSearchBar(txt: $searchText)
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
