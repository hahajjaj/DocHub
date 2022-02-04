//
//  Activity_Cell_View.swift
//  DocHub
//
//  Created by Hamza Hajjaj on 07/07/2021.
//

import SwiftUI

struct Activity_Cell_View: View {
    let activite: Result
    
    var body: some View {
        
//        ZStack(alignment: .leading) {
            HStack {
//                ImageView(withURL: "https://dochub.be\(activite.actor.avatar)")
//                    .clipShape(Circle())
//                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
//                    .overlay(Circle().stroke(Color.black, lineWidth: 3))
//                    .frame(width: 50)
//                    .padding([.leading, .trailing])
                Text("\(activite.actor.name) \(activite.verb) \(activite.target.name) (\(activite.target.slug))")
                    .font(.system(size: 13))
                    .font(.headline)
                    .fontWeight(.bold)
                    .lineLimit(3)
            }
            .padding(.top, 10)
            .padding(.bottom, 10)
            .padding(.horizontal, 10)
//            .padding(.leading, 5)
//            .padding(.trailing, 10)
//            .padding(15)
//        }
//        .padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
//        .padding(.bottom, 5)
//        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

//struct Activity_Cell_View_Previews: PreviewProvider {
//    static var previews: some View {
//        Activity_Cell_View()
//            .previewLayout(.sizeThatFits)
//    }
//}
