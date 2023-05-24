//
//  DetailSectionPart.swift
//  MovieTheater
//
//  Created by Tran Hieu on 24/05/2023.
//

import SwiftUI


struct DetailSectionPart: View {
    let section: DetailViewSection
    let namespace: Namespace.ID
    @Binding var selectedSection: DetailViewSection
    

    var body: some View {
        Text(section.rawValue)
            .bold()
            .background(
                ZStack {
                    if section == selectedSection {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 3)
                            .offset(y: 20)
                            .matchedGeometryEffect(id: "Detail", in:    namespace)
                    }
                }
            
            )
            .padding()
        
    }
}

struct DetailSectionPart_Previews: PreviewProvider {
    static var previews: some View {
        DetailSectionPart(section: .about, namespace: Namespace().wrappedValue, selectedSection: .constant(.about))
    }
}


enum DetailViewSection: String {
    case about, review
    
    var rawValue: String {
        switch self {
        case .about:
            return "About Movie"
        case .review:
            return "Review"
        }
    }
}

