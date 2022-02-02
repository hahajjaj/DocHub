//
//  FileDownloader.swift
//  DocHub
//
//  Created by Hamza Hajjaj on 28/06/2021.
//

import Foundation
import SwiftUI



//class DownloaderViewModel: ObservableObject {
//    @Published var data : Data?
//    @Published var downloadProgress: CGFloat = 0
//    @Published var showDownloadProgress = false
//    let tokenn = "197657d2e21b1a13cf76d9bb8d6cff2b1434adfa"
//
//
//    func fetchFile(url_param: String) {
//        guard let url = URL(string: url_param) else { return }
//
//        var request = URLRequest(url: url)
//        request.setValue("Token \(tokenn)", forHTTPHeaderField: "Authorization")
//        request.httpMethod = "GET"
//
//        let downloadTask = URLSession.shared.downloadTask(with: request) { urlOrNil, responseOrNil, errorOrNil in
//            guard let fileURL = urlOrNil else { return }
//                do {
//                    let Data = try Data(contentsOf: fileURL)
//                    DispatchQueue.main.async {
//                        self.downloadProgress = 0
//                        withAnimation{self.showDownloadProgress = true}
//                        self.data = Data
//                    }
//                } catch {
//                    print ("file error: \(error)")
//                }
//        }
//        downloadTask.resume()
//    }
//}

class Downloader_PDF_ViewModel: ObservableObject {
    @Published var showPDF: Bool = false
    @Published var data : Data?
    var destURLs: URL?
    let tokenn = "5732fc1a2be10525a1e0e268b38e3a453bf80467"
//    @Binding var isFinished: Bool
    
//    init(isFinished: Binding<Bool>){
//        self._isFinished = isFinished
//    }
    
    func fetchFile(url_param: String) {
        guard let url = URL(string: url_param) else { return }
        var request = URLRequest(url: url)
        request.setValue("Token \(tokenn)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"

        let downloadTask = URLSession.shared.downloadTask(with: request) { urlOrNil, responseOrNil, errorOrNil in
            guard let fileURL = urlOrNil else { return }
                do {
                    let Data = try Data(contentsOf: fileURL)
                    DispatchQueue.main.async {
                        self.data = Data
                        let destURL = FileManager.default.temporaryDirectory.appendingPathComponent("tempFile.pdf")
                        self.destURLs = destURL
                        self.showPDF.toggle()
                        print(self.destURLs!)
                        do{
                            try Data.write(to: destURL)
                        }catch{
                            print(error)
                        }
                    }
                } catch {
                    print ("file error: \(error)")
                }
        }
        downloadTask.resume()
    }
}
