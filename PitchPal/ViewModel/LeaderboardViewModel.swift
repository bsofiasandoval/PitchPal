//
//  LeaderboardViewModel.swift
//  PitchPal
//
//  Created by Sofia Sandoval on 3/22/24.
//

import Foundation

class LeaderboardViewModel: ObservableObject {
    @Published var entries: [Leaderboard] = []
    
    init() {
        loadSampleData()
    }
    
    func loadSampleData() {
        // Sample data for demonstration
        entries = [
            Leaderboard(name: "Alice", rank: 1),
            Leaderboard(name: "Bob", rank: 2),
            Leaderboard(name: "Charlie", rank: 3),
            Leaderboard(name: "Diana", rank: 4),
            Leaderboard(name: "Edward", rank: 5)
            // Add more entries as needed
        ]
    }
}
