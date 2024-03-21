//
//  DashboardView.swift
//  PitchPal
//
//  Created by Sofia Sandoval on 3/20/24.
//

import SwiftUI
import Charts

struct DashboardView: View {
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
            "Clarity": .red,
            "Engagement": .gray,
            "Fluency": .black
        ])
        .frame(width: 341, height: 143)
        .padding(.vertical)
    }
}

struct PitchEvaluationChartView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .background(Color.red)
            .cornerRadius(10)
    }
}
