//
//  DocHubApp.swift
//  DocHub
//
//  Created by Hamza Hajjaj on 09/06/2021.
//

import SwiftUI

@main
struct DocHubApp: App {
    @State var auth = false
    var body: some Scene {
        WindowGroup {
            if auth {
                ContentView()
                    .transition(.move(edge: .trailing))
            } else {
                AuthView(signInSuccess: $auth)
                    .transition(.move(edge: .trailing))
            }
            
        }
    }
}
