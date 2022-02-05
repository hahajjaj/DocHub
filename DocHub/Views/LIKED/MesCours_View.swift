//
//  MesCours_View.swift
//  DocHub
//
//  Created by Hamza Hajjaj on 07/07/2021.
//

import SwiftUI

struct MesCours_View: View {
    
    @ObservedObject var profils = ProfilViewModel()
    @ObservedObject var tokk : tokkennn
    
    init(objetToken: tokkennn) {
        self.tokk = objetToken
        self.profils.fetchUser(tokenn: tokk.token)
    }
    
    var body: some View {
        NavigationView {
            List{
                ForEach(profils.profil?.followedCourses ?? [], id: \.self){ position in
                    NavigationLink(destination: Document_List_View(slug: position.slug,objetToken: tokk)) {
                        ActivityView2(slug: position.slug, cours_name: position.name)
                    }
                    
                }
            }
            .frame(maxWidth: .infinity)
            .edgesIgnoringSafeArea(.horizontal)
            .listStyle(GroupedListStyle())
//            .navigationBarTitle("Mes cours", displayMode: .inline)
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Text("Mes cours")
                        .foregroundColor(Color(.black))
                        .font(Font.title3.weight(.bold))
                }
            }
        }
        .accentColor(.black)
    }
}

struct MesCours_View_Previews: PreviewProvider {
    static var previews: some View {
        MesCours_View(objetToken: tokkennn())
    }
}

struct ActivityView2: View {
    var slug: String
    var cours_name: String

    var body: some View {
        ZStack(alignment: .leading) {
            Color.white
                .cornerRadius(12)
            Cours_cell_View(slug: slug, cours_name: cours_name)
        }
        .fixedSize(horizontal: false, vertical: true)
//        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}
