//
//  LeaderboardView.swift
//  PitchPal
//
//  Created by Sofia Sandoval on 3/20/24.
//

import SwiftUI

struct LeaderboardView: View {
    @State private var showProfile = false
    @StateObject var viewModel = LeaderboardViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Profile Picture and Name
                VStack() {
                    Image(.leaderboardIcon)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 300)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                        .padding(.top, 20)
                        .padding(.bottom,40)
                    
                }
                .background(Color(UIColor.systemBackground)) // Match the background color of the navigation bar

                // Leaderboard Entries List
                List(viewModel.entries) { entry in
                    HStack {
                        Text(entry.name)
                        Spacer()
                        if entry.rank == 1 {
                            Image(systemName: "trophy.fill")
                                .foregroundColor(.yellow)
                        } else {
                            Image(systemName: "medal.fill")
                                .foregroundColor(entry.rank == 2 ? .gray : .orange)
                        }
                    }
                    .padding(.vertical, 5)
                }
                .listStyle(PlainListStyle()) // Use PlainListStyle for the list
            }
            .navigationTitle("Leaderboard")
            .navigationBarItems(trailing:
                Button(action: {
                    showProfile = true
                }) {
                    Image(systemName: "person.fill").accessibilityLabel("Profile")
                }
            )
            .background(
                NavigationLink(destination: ProfileView(), isActive: $showProfile) { EmptyView() }
                    .hidden()
            )
        }
    }
}


struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
