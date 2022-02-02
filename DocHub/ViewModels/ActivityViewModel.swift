//
//  ActivityViewModel.swift
//  DocHub
//
//  Created by Hamza Hajjaj on 07/07/2021.
//

import Foundation

class ActivityViewModel: ObservableObject {
    let tokenn = "5732fc1a2be10525a1e0e268b38e3a453bf80467"
    @Published var activite: ActivityModel?
    @Published var isLoading: Bool = true

    
    func fetchActivity() {
        guard let url = URL(string: "https://dochub.be/api/me/actions/") else { return }
        
        var request = URLRequest(url: url)
        request.setValue("Token \(tokenn)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            do {
                let us = try JSONDecoder().decode(ActivityModel.self, from: data)
                DispatchQueue.main.async {
                    self.activite = us
//                    print(self.activite)
                    self.isLoading = false
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
