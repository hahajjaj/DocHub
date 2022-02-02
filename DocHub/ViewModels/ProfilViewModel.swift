//
//  UserViewModel.swift
//  DocHub
//
//  Created by Hamza Hajjaj on 24/06/2021.
//

import Foundation


class ProfilViewModel: ObservableObject {
    let tokenn = "5732fc1a2be10525a1e0e268b38e3a453bf80467"
    @Published var profil: Profil?
    @Published var isLoading: Bool = true
    
    func getURL() -> String{
        let url = "https://dochub.be"+(profil?.avatar ?? "")
        print(url)
        return url
    }
    
    func fetchUser() {
        guard let url = URL(string: "https://dochub.be/api/me/") else { return }
        
        var request = URLRequest(url: url)
        request.setValue("Token \(tokenn)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            do {
                let us = try JSONDecoder().decode(Profil.self, from: data)
                DispatchQueue.main.async {
                    self.profil = us
                    
                    self.isLoading = false
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
