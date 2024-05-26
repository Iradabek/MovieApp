//
//  TabView.swift
//  MovieDemo
//
//  Created by Irada Bakirli on 27.05.24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            LoginView()
                .tabItem {
                    Label("Login", systemImage: "person.fill")
                }
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
        }
    }
}

#Preview {
    MainView()
}

