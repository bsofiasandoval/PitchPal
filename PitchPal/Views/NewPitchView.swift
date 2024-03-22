import SwiftUI

struct NewPitchView: View {
    @State private var title: String = ""
    @State private var notes: String = ""
    @State private var selectedMinutes: Int = 0
    @State private var selectedSeconds: Int = 0
    @State private var navigateToRecording = false
    @State private var showProfile = false 

    let minutesRange = 0..<10
    let secondsRange = 0..<60
    
    var body: some View {
        Form {
            Section(header: Text("Pitch Details")) {
                TextField("Title", text: $title)
                TextField("Notes", text: $notes)
            }
            Section(header: Text("Duration")) {
                HStack {
                    Spacer()
                    Picker("Minutes", selection: $selectedMinutes) {
                        ForEach(minutesRange, id: \.self) {
                            Text("\($0) min").tag($0)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 100, height: 150)
                    Spacer()
                    Picker("Seconds", selection: $selectedSeconds) {
                        ForEach(secondsRange, id: \.self) {
                            Text("\($0) sec").tag($0)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 100, height: 150)
                    Spacer()
                }
            }
            Section {
                ZStack {
                    NavigationLink(destination: RecordingView(timeLimit: convertToSeconds(minutes: selectedMinutes, seconds: selectedSeconds)), isActive: $navigateToRecording) { EmptyView() }
                    Button("Record Pitch") {
                        navigateToRecording = true
                    }
                }
            }
        }
        .navigationTitle("New Pitch")
        .navigationBarItems(trailing: Button(action: {
            print("Person icon tapped")
        }) {
            Image(systemName: "person").accessibilityLabel("Profile")
        })
    }
}

func convertToSeconds(minutes: Int, seconds: Int) -> Int {
    let totalSeconds = (minutes * 60) + seconds
    return totalSeconds
}

struct NewPitchView_Previews: PreviewProvider {
    static var previews: some View {
        // Embedding NewPitchView in a NavigationView for previewing purposes
        NavigationView {
            NewPitchView()
        }
    }
}
