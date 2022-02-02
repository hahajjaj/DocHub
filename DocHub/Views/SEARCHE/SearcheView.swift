//
//  SearcheView.swift
//  DocHub
//
//  Created by Hamza Hajjaj on 07/07/2021.
//

import SwiftUI

struct SearcheView: View {
    @State var searchText = ""
    
    var body: some View {
        
        NavigationView{
            VStack(alignment: .leading) {
                SearchBar(text: $searchText)
                    .padding(.top)
                Divider()
                    .padding(.horizontal, 8)
                Spacer()
            }
            .navigationBarTitle("Dochub", displayMode: .inline)
        }
        
    }
}

struct SearcheView_Previews: PreviewProvider {
    static var previews: some View {
        SearcheView()
    }
}
