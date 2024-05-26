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
            
            NavigationView {
                List(viewModel.movieList) { item in
                    
                    NavigationLink(destination: DetailsView(movie:item)) {
                        HStack() {
                            if let imageUrl = URL(string: item.image ?? "") {
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
                            //Spacer()
                            
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.system(size: 18, weight: .bold, design: .serif))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                                    .frame(height:2)
                                
                                HStack {
                                    Text(item.rating)
                                    Text(item.id)
                                    Text("\(item.year)")
                                }
                                .font(.system(size: 14, weight: .semibold, design: .serif))
                                .foregroundColor(.customYellow)
                                
                                Spacer()
                                    .frame(height:3)
                                
                                Text("Genre: \(item.genre.joined(separator: ", "))")
                                    .font(.system(size: 14, weight: .regular, design: .serif))
                                    .foregroundColor(.customYellow)
                                
                                
                                Spacer()
                                    .frame(height:3)
                                
                                Text(item.description)
                                    .font(.system(size: 14, weight: .regular, design: .serif))
                                    .lineLimit(5)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                .navigationTitle("Discover")
            }
            .background(Color.black)
        }
    }

#Preview {
    HomeView(viewModel: .init(movieList: []))
}
