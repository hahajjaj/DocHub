//
//  NavBarView.swift
//  DocHub
//
//  Created by Hamza Hajjaj on 25/06/2021.
//

import SwiftUI
struct ShowPass: View {
    
    var tokennnn: String
    @State private var showToken = false
    let swiftColor = UIColor(rgb: 0x020202)
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .frame(width: roundedRectangleSize, height: roundedRectangleSize / 6)
                .foregroundColor(color)
            Rectangle()
                .frame(width: roundedRectangleSize - (roundedRectangleSize / 7.5), height: roundedRectangleSize / 14)
                .offset(x: -(roundedRectangleSize / 7.5)/2)
                .foregroundColor(.white)
                .shadow(color: Color.white, radius: 5, x: 0, y: 0)
                .opacity(showToken ? 0.8 : 0)
            HStack {
                Image(systemName: "lock.fill")
                    .padding(.leading)
                    .frame(width: roundedRectangleSize / 12, height: roundedRectangleSize / 12)
                    .foregroundColor(showToken ? Color(swiftColor) : .gray)
                    
                    
                if showToken {
                    Spacer()
                    Text(tokennnn)
                        .font(.system(size: 12.5))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(swiftColor))
                    Spacer()
                } else {
                    Spacer()
                    Text(nb_etoiles_token())
                        .font(.system(size: 60))
                        .foregroundColor(.gray)
                        .padding(.bottom,9)
                    Spacer()
                }
                Image(systemName: showToken ? "flashlight.on.fill" : "flashlight.off.fill")
                    .resizable()
                    .frame(width: roundedRectangleSize / 14, height: roundedRectangleSize / 10)
                    .foregroundColor(.gray)
                    .rotationEffect(.degrees(-90))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            showToken.toggle()
                        }
                    }
                    .padding(.trailing)
            }
            .frame(width: roundedRectangleSize, height: roundedRectangleSize / 5)
        }
    }
    
    func nb_etoiles_token() -> String{
        let nbr = String(repeating: "•", count: 10)
        return nbr
    }
    
    //MARK: - Drawing Constants
    let roundedRectangleSize: CGFloat = 410
    let cornerRadius: CGFloat = 15
    let color: Color = Color(UIColor(rgb: 0x242424))
}


//struct ShowPass_Preview: PreviewProvider {
//    static var previews: some View {
//        ShowPass()
//    }
//}
