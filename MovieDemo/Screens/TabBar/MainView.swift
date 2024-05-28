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
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                        
                    }
                
                SearchView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                        
                    }
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
            }
        .customTabBarAppearance()
        
    }
}

#Preview {
    MainView()
}

struct CustomTabBarAppearance: ViewModifier {
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.black
        
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.customYellow
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.customYellow]

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    func body(content: Content) -> some View {
        content
    }
}

extension View {
    func customTabBarAppearance() -> some View {
        self.modifier(CustomTabBarAppearance())
    }
}

