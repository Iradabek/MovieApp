//
//  LoginView.swift
//  MovieDemo
//
//  Created by Irada Bakirli on 27.05.24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Image("scarlett")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 72, height: 72)
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color.customYellow, lineWidth: 2)
                            )
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Scarlett Johansson")
                                .font(.title2)
                                .bold()
                            Text("examplejohansson@gmail.com")
                                .foregroundColor(.gray)
                            
                            Button(action: {
                                 //no action heleki
                            }) {
                                Text("Edit Profile")
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.customYellow.opacity(0.4))
                                    )
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(.leading, 10)
                    }
                    .padding()
                    .background(Color.customYellow.opacity(0.2))
                    .cornerRadius(15)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Activities")
                            .bold()
                            .font(.title3)
                        
                        Text("Preferences")
                            .bold()
                            .font(.title3)
                        
                        Text("Settings")
                            .bold()
                            .font(.title3)
                    }
                    .padding()
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Profile")
        }
    }
}





#Preview {
    ProfileView()
}
