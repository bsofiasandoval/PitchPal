//
//  ProfileView.swift
//  PitchPal
//
//  Created by Sofia Sandoval on 3/21/24.
//
import SwiftUI

struct ProfileView: View {
    @State private var pitchModel = PitchModel()
    @State private var showingNewPitchView = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Profile Picture
                Image("profile") // Corrected to use a string for the image name
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .shadow(radius: 4)
                    .padding(.top, 40)
                
                // Name
                Text("Natalie Garcia")
                    .font(.title2)
                    .bold()
                
                // Best Pitches Section
                VStack(alignment: .leading) {
                    Text("Best Pitches")
                        .font(.title2)
                        .bold()
                        .padding(.top, 20)
                        .padding(.horizontal)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 10) {
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
                                    .frame(width: 354, height: 158)
                                    .background(randomColor())
                                    .cornerRadius(21)
                                }
                                .buttonStyle(PlainButtonStyle()) // Use this to keep the NavigationLink styling neutral
                            }
                        }
                        .padding(.horizontal)
                    }
                    .frame(height: 336)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity)
        }
        .navigationTitle("Profile")
    }
    
    func randomColor() -> Color {
        let redComponent = Double.random(in: 0.5...0.8)
        let greenComponent = Double.random(in: 0...0.2)
        let blueComponent = Double.random(in: 0...0.2)
        
        return Color(red: redComponent, green: greenComponent, blue: blueComponent)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        // Embed ProfileView in a NavigationView for previewing
        NavigationView {
            ProfileView()
        }
    }
}
