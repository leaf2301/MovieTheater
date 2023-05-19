//
//  ContentView.swift
//  MovieTheater
//
//  Created by Tran Hieu on 15/05/2023.
// Key: e00f0369ab2e8426b3afb4ba934a6eb3
// //https://api.themoviedb.org/3/movie/550?api_key=e00f0369ab2e8426b3afb4ba934a6eb3 eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMDBmMDM2OWFiMmU4NDI2YjNhZmI0YmE5MzRhNmViMyIsInN1YiI6IjY0NjIxNGE2OGM0NGI5MDE3MDZmZGNiNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sJxLQ9HhoGpF4g6q1eT3seBXAimmj1rdED7ngTPhkU8

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
