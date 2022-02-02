//
//  Cours_cell_View.swift
//  DocHub
//
//  Created by Hamza Hajjaj on 07/07/2021.
//

import SwiftUI

struct Cours_cell_View: View {
    let slug: String
    let cours_name: String
    
    var body: some View {
        
//        ZStack(alignment: .leading) {
            HStack {
                Image(systemName: "folder")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 38, height: 38, alignment: .leading)
                VStack(alignment: .leading) {
                    Text(cours_name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .lineLimit(2)
                    
                    Text(slug)
                        .padding(.bottom, 5)
                }
                .padding(.horizontal, 5)
            }
            .padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .padding(.bottom, 5)
            .padding(.leading, 10)
            .padding(.trailing, 10)
//            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
//            .padding(15)
//        }
//        .padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
//        .padding(.bottom, 5)
//        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

struct Cours_cell_View_Previews: PreviewProvider {
    static var previews: some View {
        Cours_cell_View(slug: "info-f-201", cours_name: "Langage de Programmation 2")
            .previewLayout(.sizeThatFits)
    }
}

