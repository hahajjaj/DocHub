//
//  SearchViewModel.swift
//  DocHub
//
//  Created by Hamza Hajjaj on 05/02/2022.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var searchs: SearchModel?
    @Published var isLoading: Bool = true
    
    func fetchSearch(tokenn: String, mot_recherche: String) {
        let urlString = "https://dochub.be/api/search/courses/?query=" + mot_recherche
        let urlStringForQuery = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let url = URL(string: urlStringForQuery!) else { return }
        
        var request = URLRequest(url: url)
        request.setValue("Token \(tokenn)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            do {
                let us = try JSONDecoder().decode(SearchModel.self, from: data)
                DispatchQueue.main.async {
                    self.searchs = us
                    print(us)
                    self.isLoading = false
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
