//
//  DetailView.swift
//  MovieTheater
//
//  Created by Tran Hieu on 24/05/2023.
//

import SwiftUI


struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    @Namespace var namespace
    @StateObject private var vm: DetailViewModel
    init(movie: Movie) {
        _vm = StateObject(wrappedValue: DetailViewModel(movie: movie))
    }

    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                ZStack(alignment: .top) {
                    CustomImage(imageWidth: screenWidth, imageHeight: posterImageHeight, movie: vm.movie)
                    HStack {
                        Image.BackIcon
                            .onTapGesture {
                                dismiss()
                            }
                        
                        Spacer()
                        Text("Detail")
                        Spacer()
                        Image.BookmarkIcon
                    }
                    .padding()
                    .background(Color.AppBackgroundColor)
                    
                }
                
                HStack {
                    CustomImage(imageWidth: backdropImageSize, imageHeight: backdropImageSize, movie: vm.movie, imageType: .backdrop)
                    Text(vm.movie.title)
                        .minimumScaleFactor(0.5)
                        .padding(.top, titleOffset)
                        .bold()
                    
                }
                .padding()
                .offset(y: backdropImageOffset)
            }
            
            VStack {
                HStack {
                    Image.CalendarIcon
                    Text(vm.movie.releaseDate ?? "")
                    Text("|")
                    Image.ClockIcon
                    Text("148minute")
                    Text("|")
                    Image.GenreIcon
                    Text("Action")
                    Text("|")

                }
                .foregroundColor(Color.AppGrayColor2)
                .frame(maxWidth: .infinity)
                
                HStack {
                    ForEach(vm.selection, id: \.self) { section in
                        DetailSectionPart(section: section, namespace: namespace, selectedSection: $vm.selectedSection)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    vm.selectedSection = section
                                }
                            }
                        
                    }
                }
                
                switch vm.selectedSection {
                case .about:
                    Text(vm.movie.overview)
                case .review:
                    ScrollView {
                        ForEach(vm.reviews) { review in
                            ReviewCard(review: review)
                        }
                        
                    }
                }
                Spacer()
            }
            .padding()
            .padding(.top, content)
            
            
        }
        .preferredColorScheme(.dark)
        .background(Color.AppBackgroundColor)
    }
    
    var posterImageHeight: CGFloat {
        screenHeight * 0.35
    }
    var backdropImageSize: CGFloat {
        screenHeight * 0.15
    }
    var backdropImageOffset: CGFloat {
        screenHeight * 0.15
    }
    var titleOffset: CGFloat {
        screenHeight * 0.13
    }
    var content: CGFloat {
        screenHeight * 0.04
    }

}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movie: dev.movieInstance)
    }
}


