//
//  coursDetailsModel.swift
//  DocHub
//
//  Created by Hamza Hajjaj on 27/06/2021.
//

import Foundation

class CoursDetailsViewModel: ObservableObject {
    
    @Published var cours_details: CoursDetail?
    @Published var isLoading: Bool = true
    
    func fetchCours(mnemonique: String, tokenn: String) {
        guard let url = URL(string: "https://dochub.be/api/courses/\(mnemonique)/") else { return }
        
        var request = URLRequest(url: url)
        request.setValue("Token \(tokenn)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            do {
                let elem = try JSONDecoder().decode(CoursDetail.self, from: data)
                DispatchQueue.main.async {
                    self.cours_details = elem
                    
                    self.isLoading = false
                    
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
