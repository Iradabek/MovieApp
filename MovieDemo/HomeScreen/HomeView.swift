//
//  ContentView.swift
//  MovieDemo
//
//  Created by Irada Bakirli on 23.05.24.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel = HomeViewModel(movieList: [])
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hey, I wanna watch movie!")
            .bold() }
        .padding()
        

        List(viewModel.movieList) { item in
            HStack() {
                if let imageUrl = URL(string: item.image) {
                    KFImage(imageUrl)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .cornerRadius(10)
                } else {
                    Image(systemName: "notFound")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .cornerRadius(10)
                        .foregroundColor(.gray)
                }
                Spacer()
               .clipShape(Capsule())
                
                VStack{
                    Text(item.title)
                        .bold()
                        .padding()
                    Text(item.description)
                }
            }
        }
    }
}

#Preview {
    HomeView(viewModel: .init(movieList: []))
}
