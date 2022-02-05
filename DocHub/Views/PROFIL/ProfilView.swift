//
//  ProfilView.swift
//  DocHub
//
//  Created by Hamza Hajjaj on 25/06/2021.
//

import SwiftUI
import Combine

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}


struct ProfilView: View {
//    let swiftColor = UIColor(rgb: 0x061826)
    let swiftColor = UIColor(rgb: 0x020202)
    let customDark = UIColor(rgb: 0x3f363f)
    @ObservedObject var profils = ProfilViewModel()
    @ObservedObject var activites = ActivityViewModel()
    @ObservedObject var tokk : tokkennn
    
    init(objetToken: tokkennn) {
//        UINavigationBar.appearance().barTintColor = swiftColor
//        UINavigationBar.appearance().backgroundColor = swiftColor
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : customDark, .font: UIFont.systemFont(ofSize: 20)]
        self.tokk = objetToken
        self.profils.fetchUser(tokenn: tokk.token)
        self.activites.fetchActivity(tokenn: tokk.token)
    }
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 0){
                
                HStack{
                    ImageView(withURL: "https://dochub.be\(profils.profil?.avatar ?? "")")
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.black, lineWidth: 3))
                        .frame(width: 100, height: 100)
                        .padding([.top, .bottom, .trailing])
                    VStack {
                        HStack {
                            Text(profils.profil?.firstName ?? "")
                                .font(.headline)
                                .fontWeight(.bold)
                            Text(profils.profil?.lastName ?? "")
                                .font(.headline)
                                .fontWeight(.bold)
    //                        Text(profils.profil?.netid ?? "")
    //                        Text(profils.profil?.email ?? "")
                        }
                        .padding(.horizontal)
                        Text(profils.profil?.email ?? "")
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    .padding(.leading, 25)
                    .padding(.trailing, 20)
                    
                    
                }
                .frame(maxWidth: .infinity)
//                .background(Color(customDark))
                
//                Spacer()
//                Divider()
                List{
                    ForEach(activites.activite?.results.prefix(10) ?? [], id: \.self){ activitess in
                        ActivityView(activite: activitess)
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
                .listStyle(PlainListStyle())
                
                             
//                VStack(alignment: .leading){
//                    Text("Token")
//
//                    Text(profils.profil?.token.key ?? "")
//                }
//                Divider()
                
//                ShowPass(tokennnn: profils.profil?.token.key ?? "")
//                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
//                    .padding(.bottom)
            }
            
//            .navigationBarTitle("PROFIL", displayMode: .inline)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Text("PROFIL")
                        .foregroundColor(Color(customDark))
                        .font(Font.title3.weight(.bold))
                }
            }
        }
        
        .accentColor(.white)
            
                
            
        
    }
}


struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView(objetToken: tokkennn())
    }
}

struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()

    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }

    var body: some View {
        
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
        }
    }
}

class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }

    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}

