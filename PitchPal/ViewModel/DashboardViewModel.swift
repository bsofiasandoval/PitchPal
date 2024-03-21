//
//  DashboardViewModel.swift
//  PitchPal
//
//  Created by Sofia Sandoval on 3/20/24.
//

import Foundation

class DashboardViewModel: ObservableObject {
    // Published property to update the view whenever evaluations change
    @Published var evaluations: [DashboardModel] = []

    init() {
        loadEvaluations()
    }

    func loadEvaluations() {
        // This is a placeholder for where you might load data from a database or perform calculations
        evaluations = [
            DashboardModel(category: "Clarity", score: 7),
            DashboardModel(category: "Engagement", score: 10),
            DashboardModel(category: "Fluency", score: 7)
        ]
    }
}
