//
//  Test_cell_design.swift
//  DocHub
//
//  Created by Hamza Hajjaj on 07/07/2021.
//

import SwiftUI
extension UIColor {
    
    static let flatDarkBackground = UIColor(red: 36, green: 36, blue: 36)
    static let flatDarkCardBackground = UIColor(red: 46, green: 46, blue: 46)
    
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: a)
    }
}

extension Color {
    public init(decimalRed red: Double, green: Double, blue: Double) {
        self.init(red: red / 255, green: green / 255, blue: blue / 255)
    }
    
    public static var flatDarkBackground: Color {
        return Color(decimalRed: 36, green: 36, blue: 36)
    }
    
    public static var flatDarkCardBackground: Color {
        return Color(decimalRed: 46, green: 46, blue: 46)
    }
}


struct Test_cell_design: View {
    
    var categories: [String] = ["Teeria", "Bio & Equo"]
    
    let document_detail : DocumentSet
    @ObservedObject var downloader = Downloader_PDF_ViewModel()

    
    init(document: DocumentSet){
        document_detail = document
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                
                VStack(alignment: .leading) {
                    Text(document_detail.name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .lineLimit(2)
                        .padding(.bottom,1)
                    
                    Text(document_detail.user?.name ?? "")
                        .padding(.bottom, 1)
                    
                    HStack(alignment: .center) {
                        Image(systemName: "clock")
                        Text(date_to_string(date: document_detail.date))
                        Image(systemName: "newspaper")
                            .padding(.leading)
                        
                        Text("\(document_detail.pages) pages")
                        
                    }
                    .font(.system(size: 13))
                    .padding(.bottom, 1)
                    
                    HStack {
                        ForEach(document_detail.tags, id: \.self) { category in
                            CategoryPill(categoryName: category.name)
                        }
                    }
                    
                }
                .padding(.horizontal, 5)
                Spacer()
                Button(action: {downloader.fetchFile(url_param: document_detail.pdfURL)}, label: {
                    Image(systemName: "chevron.right.circle")
                })
                .buttonStyle(PlainButtonStyle())
                .fullScreenCover(isPresented: $downloader.showPDF, content: {
                    ModalViewPDF(pdf: downloader.data!, document_detail: document_detail, url: downloader.destURLs!, isPresented: $downloader.showPDF)
                })
            }
//            .padding(15)
        }
        .padding()
//        .padding(.bottom)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}


struct CategoryPill: View {
    
    var categoryName: String
    var fontSize: CGFloat = 12.0
    
    var body: some View {
        ZStack {
            Text(categoryName)
                .font(.system(size: fontSize, weight: .regular))
                .lineLimit(2)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.green)
                .cornerRadius(5)
        }
    }
}

//func date_to_string(date : String) -> String{
//    let final = date.components(separatedBy: "T")[0]
//    return final
//}
