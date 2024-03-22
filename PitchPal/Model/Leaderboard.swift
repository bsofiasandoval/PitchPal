//
//  Leaderboard.swift
//  PitchPal
//
//  Created by Sofia Sandoval on 3/22/24.
//

import Foundation

struct Leaderboard: Identifiable {
    let id = UUID()
    let name: String
    let rank: Int
}
