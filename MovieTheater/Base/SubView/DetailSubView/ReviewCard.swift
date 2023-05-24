//
//  ReviewCard.swift
//  MovieTheater
//
//  Created by Tran Hieu on 24/05/2023.
//

import SwiftUI

struct ReviewCard: View {
    let review: Review
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(url: URL(string: review.authorImage)) { image in
                    image
                        .resizable()
                } placeholder: {
                    ZStack {
                        Color.AppGrayColor1
                        
                        if let firstChart = review.authorName.first {
                            Text(String(firstChart))
                        }
                    }
                }
                .scaledToFill()
                .frame(width: 45, height: 45)
                .clipShape(Circle())

                Text(review.authorName)
                    .bold()
            }
            
            Text(review.content)
                .bold()
            
            Divider()
        }
    }
}

struct ReviewCard_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCard(review: dev.review)
    }
}
