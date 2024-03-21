//
//  DashboardModel.swift
//  PitchPal
//
//  Created by Sofia Sandoval on 3/20/24.
//

import Foundation

struct DashboardModel: Identifiable {
    let id = UUID()
    let category: String
    let score: Int
}
