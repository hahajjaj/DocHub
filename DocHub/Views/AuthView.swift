//
//  AuthView.swift
//  DocHub
//
//  Created by Hamza Hajjaj on 04/02/2022.
//

import SwiftUI
import SafariServices

struct AuthView: View {
    let customGray = UIColor(rgb: 0xa9a4a8)
    let customGreen = UIColor(rgb: 0x42ac6a)
    let customDark = UIColor(rgb: 0x3f363f)
    
    @Binding var signInSuccess: Bool
    @State private var showSafari: Bool = false
    
    @ObservedObject var tokk : tokkennn
    
    var body: some View {
            VStack {
                Text("DocHub")
                    .foregroundColor(Color(customDark))
                    .font(.system(size: 90, weight: .black))
                    .padding(.top, 50.0)
                Spacer()
                Text("Par des étudiants\nPour des étudiants")
                    .foregroundColor(Color(customDark))
                    .font(Font.title2.weight(.black))
                    .padding(/*@START_MENU_TOKEN@*/.all, 20.0/*@END_MENU_TOKEN@*/)
                
                    
                Text("Bienvenue sur DocHub, le site de partage de documents et d'entraide étudiante à l'ULB.\nDocHub vous permet de poser des questions aux autres étudiants, échanger vos notes, vos résumés, d'anciens examens et bien plus encore.")
                    .foregroundColor(Color(customGray))
                    .padding(.vertical)
                Text("Tu n'as pas besoin de créer un compte, il suffit d'employer ton compte ULB.")
                    .foregroundColor(Color(customGray))
                    .padding(.top)
                
                Button{
                    withAnimation{
//                        self.signInSuccess.toggle()
                        showSafari.toggle()
                    }
                    
                } label: {
                    Text("Connexion avec l'ULB")
                        .fontWeight(.bold)
                        .font(.title2)
                }
                .frame(width: 250, height: 70, alignment: .center)
                .foregroundColor(.white)
                .background(Color(customGreen))
                .padding(.vertical, 45.0)
                .fullScreenCover(isPresented: $showSafari, content: {
                        SFSafariViewWrapper(url: URL(string: "https://dochub.be/users/settings/")!)
                })
            }
            .multilineTextAlignment(.center)
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(signInSuccess: .constant(true), tokk: tokkennn())
    }
}


struct SFSafariViewWrapper: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SFSafariViewWrapper>) {
        return
    }
}
