//
//  CoursDetailsView.swift
//  DocHub
//
//  Created by Hamza Hajjaj on 27/06/2021.
//

import SwiftUI

struct Document_List_View: View {
    @ObservedObject var cours_detail = CoursDetailsViewModel()
    @ObservedObject var tokk : tokkennn
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

        var backButton : some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                Image(systemName: "chevron.left") // BackButton Image
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.black)
//                    Text("Go Back") //translated Back button title
                }
            }
        }
    
    init(slug: String, objetToken: tokkennn){
        self.tokk = objetToken
        self.cours_detail.fetchCours(mnemonique: slug, tokenn: tokk.token)
    }
    
    var body: some View {
        VStack {
            List{
                ForEach(cours_detail.cours_details?.documentSet ?? [], id: \.self){ position in
//                    HStack {
//                        Cours_Cell_View(document: position)
//                    }
//                    .border(Color.black)
                    ActivityView3(document: position, tokk: tokk)
                    
                }
            }
            .frame(maxWidth: .infinity)
            .edgesIgnoringSafeArea(.horizontal)
            .listStyle(GroupedListStyle())
        }
//        .navigationTitle(cours_detail.cours_details?.name ?? "")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .navigationBarTitleDisplayMode(.inline)
        
        .toolbar{
            
            ToolbarItem(placement: .principal){
                Text(cours_detail.cours_details?.name ?? "")
                    .foregroundColor(Color(.black))
                    .font(Font.title3.weight(.bold))
            }
        }
    }
}

struct CoursDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        Document_List_View(slug: "info-f-201", objetToken: tokkennn())
    }
}

struct ActivityView3: View {
    var document: DocumentSet
    @ObservedObject var tokk : tokkennn

    var body: some View {
        ZStack(alignment: .leading) {
            Color.white
//                .cornerRadius(12)
            Test_cell_design(document: document, objetToken: tokk)
        }
        .fixedSize(horizontal: false, vertical: true)
//        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}
