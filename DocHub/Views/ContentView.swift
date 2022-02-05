//
//  ContentView.swift
//  DocHub
//
//  Created by Hamza Hajjaj on 09/06/2021.
//

import SwiftUI

struct ContentView: View {
    
//    @ObservedObject var profils = ProfilViewModel()
    @State var selection: Int = 2
    @ObservedObject var tokk : tokkennn
    init(objetToken: tokkennn) {
//        self.profils.fetchUser()
//        print(profils.profil?.avatar ?? "")
        self.tokk = objetToken
    }
    
    var body: some View {
        TabView(selection: $selection){
            SearcheView(objetToken: tokk)
                .tag(1)
            
            MesCours_View(objetToken: tokk)
                .tag(2)
            ProfilView(objetToken: tokk)
                .tag(0)
        }
        .overlay( // Overlay the custom TabView component here
            Color.white // Base color for Tab Bar
                .edgesIgnoringSafeArea(.vertical)
                .frame(height: 50) // Match Height of native bar
                .overlay(HStack {
                    Spacer()
                    
                    // Third Tab Button
                    Button(action: {
                        self.selection = 2
                    }, label: {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(Color(red: 32/255, green: 43/255, blue: 63/255))
                            .opacity(selection == 2 ? 1 : 0.4)
                    })
                    
                    
                    Spacer()
                    
                    // Second Tab Button
                    Button(action: {
                        self.selection = 1
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(Color(red: 32/255, green: 43/255, blue: 63/255))
                            .opacity(selection == 1 ? 1 : 0.4)
                    })
                    
                    Spacer()
                    
                    // First Tab Button
                    Button(action: {
                        self.selection = 0
                    }, label: {
                        Image(systemName: "house.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(Color(red: 32/255, green: 43/255, blue: 63/255))
                            .opacity(selection == 0 ? 1 : 0.4)
                    })
                    
                    Spacer()
                    
                })
        ,alignment: .bottom) // Align the overlay to bottom to ensure tab bar stays pinned.
        .shadow(radius: 5)
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(objetToken: tokkennn())
    }
}
