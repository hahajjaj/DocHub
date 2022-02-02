//
//  NavigationBarView.swift
//  DocHub
//
//  Created by Hamza Hajjaj on 18/06/2021.
//

import SwiftUI

struct NavigationBarView: View {
    var body: some View {
        HStack{
            Button(action: {}, label: {
                Image(systemName: "magnifyingglass")
                    .font(.title)
                    .foregroundColor(.black)
            })
            
            Spacer()
            
            Text("DocHub")
                .foregroundColor(.black)
                .font(Font.custom("SchulVokalDotless", size: 30))
            
            Spacer()
            
            Button(action: {}, label: {
                ZStack {
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(.black)
                }
            })
        }
        .padding(.all)

        .background(Color("custom_gray"))
        
        
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
            .previewLayout(.sizeThatFits)
//            .padding()
    }
}
