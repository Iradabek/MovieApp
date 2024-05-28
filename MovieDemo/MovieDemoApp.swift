//
//  MovieDemoApp.swift
//  MovieDemo
//
//  Created by Irada Bakirli on 23.05.24.
//

import SwiftUI

@main
struct MovieDemoApp: App {
    
    init() {
        UINavigationBar.appearance().barTintColor = UIColor.customYellow
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UITabBar.appearance().barTintColor = UIColor.black
        UITabBar.appearance().tintColor = UIColor.white
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
