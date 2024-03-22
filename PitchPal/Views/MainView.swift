//
//  MainView.swift
//  PitchPal
//
//  Created by Sofia Sandoval on 3/20/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            PitchesView()
                .tabItem{
                    Label("Pitches",systemImage:"book.pages")
                        
                }
            DiscoverView()
                .tabItem{
                    Label("Discover",systemImage: "person.2.wave.2")
                }
            LeaderboardView()
                .tabItem{
                    Label("Leaderboard",systemImage: "trophy")
                }
        }
    }
}

#Preview {
    MainView()
}
