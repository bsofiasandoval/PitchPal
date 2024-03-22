//
//  DiscoverView.swift
//  PitchPal
//
//  Created by Sofia Sandoval on 3/20/24.
//

import SwiftUI

struct DiscoverView: View {
    @State private var showProfile = false
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(spacing: 20) {
                        
                        VStack(alignment: .leading) {
                            Text("Resources")
                                .font(.system(size: 22, weight: .bold))
                                .padding(.leading)

                            // New Pitch Button
                            Button(action: {print("Resources button tapped")}) {
                                VStack {
                                    Spacer()
                                    Text("Make the most of your pitch").foregroundColor(.white).font(.title3)
                                    Image(systemName: "person.3.fill").foregroundColor(.white)
                                        .font(.system(size: 60))
                                    Spacer()
                                }
                                .frame(width: 360, height: 143)
                                .background(LinearGradient(gradient: Gradient(colors: [Color(red:0.1,green:0.1,blue:0), Color(red:0.3,green:0.28,blue:0.27)]), startPoint: .top, endPoint: .bottom))
                                .cornerRadius(21)
                            }
                            .padding(.horizontal)
                        }
                        VStack(alignment: .leading) {
                            Text("Coming Soon")
                                .font(.system(size: 22, weight: .bold))
                               
                            VStack {
                                Spacer()
                                Text("PitchPerception+").foregroundColor(.white).font(.title3).bold()
                                Text("body language recognition").foregroundColor(.white).bold()
                                Spacer()
                                Image(systemName: "figure").foregroundColor(.white)
                                    .font(.system(size: 60))
                                Spacer()
                            }
                            .frame(width: 360, height: 143)
                            .background(LinearGradient(gradient: Gradient(colors: [Color(red:0.7,green:0.18,blue:0.16), Color(red:0.81,green:0.34,blue:0.15)]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(21)
                            .padding(.bottom)
                            VStack {
                                Spacer()
                                Text("PitchPal's newest technology coming May 21st, body language recognition, powered by our AI and machine learning to make your pitches perfection.").foregroundColor(.primary).padding(.horizontal)
                                Spacer()
                            }
                            .frame(width: 360, height: 143)
                            .cornerRadius(21)
                        }
                        
                    }
                    .padding(.top)
                }
            }
            .navigationTitle("Discover")
            .navigationBarItems(trailing:
                Button(action: {
                    showProfile = true
                }) {
                    Image(systemName: "person").accessibilityLabel("Profile")
                }
                .background(
                    NavigationLink(destination: ProfileView(), isActive: $showProfile) { EmptyView() }
                    .hidden()
                )
            )
        }
    }
}

#Preview {
    DiscoverView()
}
