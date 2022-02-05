//
//  SearcheView.swift
//  DocHub
//
//  Created by Hamza Hajjaj on 07/07/2021.
//

import SwiftUI

struct SearcheView: View {
    @State var searchText: String = ""
    @ObservedObject var search = SearchViewModel()
    @ObservedObject var tokk : tokkennn
    
    init(objetToken: tokkennn) {
        
        self.tokk = objetToken
//        self.search.fetchSearch(tokenn: tokk.token, mot_recherche: "base de doné")
    }
    var body: some View {
        
        NavigationView{
            VStack {
                SearchBar(text: $searchText)
                    .onChange(of: searchText){
                        self.search.fetchSearch(tokenn: tokk.token, mot_recherche: $0)
                    }
                List{
                    ForEach(search.searchs ?? [], id: \.self){ position in
    //                    HStack {
    //                        Cours_Cell_View(document: position)
    //                    }
                        HStack {
                            Text(position.name)
                            Text(position.slug)
                        }
    //                    .border(Color.black)
//                        ActivityView3(document: position, tokk: tokk)
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .edgesIgnoringSafeArea(.horizontal)
                .listStyle(GroupedListStyle())
//                Spacer()
//                Button("test recherche"){
//                    search.fetchActivity(tokenn: tokk.token, mot_recherche: "bas de doné")
//                }
            }
//            .navigationBarTitle("Dochub", displayMode: .inline)
        }
        
        
    }
}

struct SearcheView_Previews: PreviewProvider {
    static var previews: some View {
        SearcheView(objetToken: tokkennn())
    }
}
