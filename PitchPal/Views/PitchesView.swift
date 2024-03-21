//
//  ContentView.swift
//  PitchPal
//
//  Created by Sofia Sandoval on 3/20/24.
//

import SwiftUI

struct PitchesView: View {
    private let pitches = ["Pitch 1", "Pitch 2", "Pitch 3","Pitch 4"]
    
    init() {
            // Customizing navigation bar appearance
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.white // Navigation bar background color
            
            // Foreground color for title and items
            let foregroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1)

            appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
              
            
            // Set the appearance for all navigation bar states
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationView {
            ScrollView { // Enclose everything in a primary ScrollView
                VStack(spacing: 20) { // Adjust spacing as needed
                    VStack(alignment: .leading) {
                        Text("Recently Added")
                            .font(.system(size: 22, weight: .bold))
                            .padding(.horizontal) // Apply consistent horizontal padding
                      
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(pitches, id: \.self) { pitch in
                                    Text(pitch)
                                        .frame(width: 158, height: 158) // Specify frame size
                                        .foregroundColor(.white)
                                        .background(randomColor())
                                        .cornerRadius(21)
                                }
                            }
                            .padding(.horizontal) // Ensure horizontal padding matches surrounding content
                        }
                        .frame(height: 158) // Ensure ScrollView doesn't expand beyond the desired height
                    }
                    
                    // Dashboard Section
                    VStack(alignment:.leading){
                   
                        VStack{
                            Text("Dashboard")
                                .font(.system(size: 22, weight: .bold))
                            .padding(.horizontal)
                        }
                        
                        VStack(alignment:.center){
                            Text("")
                            DashboardView()
                                .frame(height: 143)
                                .padding(.horizontal)
                                .padding(.vertical)
                                .background(Color.white)
                                .cornerRadius(21)

                        }
                        

                    }
    
                    // New Pitch Button
                    VStack{
                        Button(action: {print("New Pitch button tapped")}) {
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
                    } // Align button padding with the rest of the content
                }
                .padding(.top) // Add top padding to the VStack within the ScrollView
               
            }
            .navigationTitle("Pitches")
            
            .background(Color(red:0.91,green:0.91,blue:0.91))
            .navigationBarItems(trailing: Button(action: {print("Person icon tapped")}) {
                Image(systemName: "person.fill").accessibilityLabel("Profile")
            })
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
