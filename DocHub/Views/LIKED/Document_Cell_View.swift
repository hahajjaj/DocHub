//
//  CoursListeView.swift
//  DocHub
//
//  Created by Hamza Hajjaj on 28/06/2021.
//

import SwiftUI

struct Document_Cell_View: View {
    let document_detail : DocumentSet
    @ObservedObject var downloader = Downloader_PDF_ViewModel()

    
    init(document: DocumentSet){
        document_detail = document
    }
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(document_detail.name)
                    Text(document_detail.user?.name ?? "")
                    Spacer()
                }
                .font(.custom("SchulVokalDotless.ttf", size: 17))
                
                
                HStack{
                    Text("\(document_detail.pages) pages")
                    Text("Uploadé le \(date_to_string(date: document_detail.date))")
                    Spacer()
                }
            }
            .padding([.top, .leading, .bottom])
            Spacer()
            Button(action: {downloader.fetchFile(url_param: document_detail.pdfURL)}, label: {
                Text("Télécharger")
            })
            .fullScreenCover(isPresented: $downloader.showPDF, content: {
                ModalViewPDF(pdf: downloader.data!, document_detail: document_detail, url: downloader.destURLs!, isPresented: $downloader.showPDF)
            })
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
        .border(Color.black)
    }
}



func date_to_string(date : String) -> String{
    let final = date.components(separatedBy: "T")[0]
    return final
}



struct ModalViewPDF: View {
    @State var showShareSheet: Bool = false
    var pdf: Data
    let document_detail : DocumentSet
    let url: URL
    @Binding var isPresented: Bool

    var body: some View {
        NavigationView{
            PDFKitRepresentedView(pdf)
                .navigationBarTitle(document_detail.name, displayMode: .inline)
                .navigationBarItems(leading: Button(action: {isPresented.toggle()}, label: {Image(systemName: "xmark").font(.system(size: 20))}).padding(.trailing), trailing: Button(action: {self.showShareSheet.toggle()}, label: {Image(systemName: "square.and.arrow.up").resizable().aspectRatio(contentMode: .fit).font(.system(size: 20))})
                                        .sheet(isPresented: $showShareSheet, content: {
                                            ActivityViewController(activityItems: [url])
                                        })
                                        .padding(.leading))
        }
        .accentColor(.black)
    }
}

struct ActivityViewController: UIViewControllerRepresentable {

    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil

    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {}

}

//struct CoursListeView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoursListeView(document_detail: )
//            .previewLayout(.sizeThatFits)
//    }
//}


