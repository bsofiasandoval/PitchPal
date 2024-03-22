//
//  PitchView.swift
//  PitchPal
//
//  Created by Sofia Sandoval on 3/22/24.
//

import SwiftUI

struct PitchView: View {
    let title: String
    @State private var navigateToRecording = false
    let feedbackItems: [(category: String, score: String)] = [
            ("Clarity", "7"),
            ("Fluency of Speech", "8"),
            ("Emotions Perceived", "Convincing")
        ]

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Analytics")
                    .font(.title2)
                    .bold()
                    .padding(.top)
                
                ZStack{
                    BigDashboardView()
                }
                
            }
            .padding(.horizontal)
            
            VStack{
                List{
                    Section(header:Text("Metrics")){
                        ForEach(feedbackItems, id: \.category) { item in
                            HStack {
                                Text(item.category)
                                Spacer()
                                Text(item.score)
                                    .foregroundColor(.accentColor)
                            }
                        }
                    }
                    
                }
            }
            
            // New Pitch Button
            Button(action: {
                navigateToRecording = true // Corrected to use the correct variable name for navigation
            }) {
                VStack {
                    Spacer()
                    Text("RePitch").foregroundColor(.white).font(.title3)
                    Image(systemName: "plus.message").foregroundColor(.white)
                        .font(.system(size: 50))
                    Spacer()
                }
                .frame(width: 360, height: 100)
                .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.71, green: 0.18, blue: 0.16), Color(red: 0.91, green: 0.34, blue: 0.31)]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(21)
            
            }
            .padding(.horizontal)
            NavigationLink(destination: RecordingView(timeLimit: 100), isActive: $navigateToRecording) {
                EmptyView()
            }
            Spacer()
        }
        .navigationTitle(title)
    }
}
struct PitchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PitchView(title: "Sample Pitch Title")
        }
    }
}
