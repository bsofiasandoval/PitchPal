//
//  ContentView.swift
//  PitchPal
//
//  Created by Sofia Sandoval on 3/20/24.
//
import SwiftUI

struct PitchesView: View {
    @State private var pitchModel = PitchModel()
    @State private var showingNewPitchView = false
    @State private var showProfile = false 

    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(spacing: 20) {
                        // Recently Added Section
                        VStack(alignment: .leading) {
                            Text("Recently Added")
                                .font(.system(size: 22, weight: .bold))
                                .padding(.horizontal)
                                
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 10) {
                                    ForEach(pitchModel.pitches) { pitch in
                                        NavigationLink(destination: PitchView(title: pitch.title)) {
                                            VStack {
                                                Text(pitch.title)
                                                    .foregroundColor(.white)
                                                    .bold()
                                                
                                                Image(systemName: pitch.symbol)
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 50))
                                            }
                                            .frame(width: 158, height: 158)
                                            .background(randomColor())
                                            .cornerRadius(21)
                                        }
                                        .buttonStyle(PlainButtonStyle()) // Use this to keep the NavigationLink styling neutral
                                    }
                                }
                                .padding(.horizontal)
                            }
                            .frame(height: 158)

                        }
                        
                        // Dashboard Section
                        VStack(alignment: .leading) {
                            Text("Dashboard")
                                .font(.system(size: 22, weight: .bold))

                            ZStack(alignment: .center) {
                                DashboardView()
                                    .padding(.horizontal)
                            }
                            
                            .frame(width: 360, height: 170)
                            .cornerRadius(21)
                        }
                        Button(action: {
                            // Trigger navigation to NewPitchView
                            self.showingNewPitchView = true}) {
                                VStack {
                                    Spacer()
                                    Text("New Pitch").foregroundColor(.white).font(.title2)
                                    Image(systemName: "plus.message").foregroundColor(.white)
                                        .font(.system(size: 60))
                                    Spacer()
                                }
                                .frame(width: 360, height: 143)
                                .background(LinearGradient(gradient: Gradient(colors: [Color(red:0.71,green:0.18,blue:0.16), Color(red:0.81,green:0.34,blue:0.31)]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(21)
                            }
                            .padding(.horizontal)
                            // Invisible NavigationLink that will trigger navigation based on showingNewPitchView state
                            .background(
                                NavigationLink(destination: NewPitchView(), isActive: $showingNewPitchView) {
                                    EmptyView()
                                }
                                .hidden()
                            )

                    }
                    
                }
            }
            .navigationTitle("Pitches")
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
            Spacer()
        }
    }
    
    func randomColor() -> Color {
        let redComponent = Double.random(in: 0.5...0.8)
        let greenComponent = Double.random(in: 0...0.2)
        let blueComponent = Double.random(in: 0...0.2)
        
        return Color(red: redComponent, green: greenComponent, blue: blueComponent)
    }
}

#Preview {
    PitchesView()
}
