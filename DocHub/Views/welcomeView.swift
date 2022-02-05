//
//  welcomeView.swift
//  DocHub
//
//  Created by Hamza Hajjaj on 04/02/2022.
//

import SwiftUI

class tokkennn: ObservableObject{
    @Published var token = ""
}

struct welcomeView: View {
    @StateObject var tokk = tokkennn()

    @State var auth = false
    var body: some View {
        if auth {
            ContentView(objetToken: tokk)
                .transition(.move(edge: .trailing))
        } else {
            AuthView(signInSuccess: $auth, tokk: tokk).onOpenURL{ url in
                if checkDeepLink(url: url, tokk: tokk){
                    print("FROM DEEP LINK")
                    auth.toggle()
                    
                }
            }
            .transition(.move(edge: .trailing))
        }
    }
}

struct welcomeView_Previews: PreviewProvider {
    static var previews: some View {
        welcomeView()
    }
}


func checkDeepLink(url: URL, tokk: tokkennn) -> Bool{
    @ObservedObject  var tokk = tokk
//    guard let host = URLComponents(url: url, resolvingAgainstBaseURL: true)?.host else {
//        return false
//    }
    tokk.token = url.absoluteString
    let stringURL = url.absoluteString
    let array = stringURL.components(separatedBy: "/")

    tokk.token = array[3]
    return true
}
