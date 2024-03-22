//
//  BigDashboardView.swift
//  PitchPal
//
//  Created by Sofia Sandoval on 3/22/24.
//

import SwiftUI
import Charts

struct BigDashboardView: View {
    // Instantiate the ViewModel
    @StateObject private var viewModel = DashboardViewModel()

    var body: some View {
        Chart {
            ForEach(viewModel.evaluations) { evaluation in
                BarMark(
                    x: .value("Category", evaluation.category),
                    y: .value("Score", evaluation.score)
                )
                .foregroundStyle(by: .value("Category", evaluation.category))
            }
        }
        .chartForegroundStyleScale([
            "Clarity": Color(red: 0.7647, green: 0.1843, blue: 0.1529),
            "Engagement": Color(red: 0.2667, green: 0.1529, blue: 0.1490),
            "Fluency": Color(red: 0.51, green: 0.18, blue: 0.28)
        ])
        .frame(width: 341, height: 200)
        .padding(.vertical)
    }
}

struct BigDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        BigDashboardView()
    }
}
