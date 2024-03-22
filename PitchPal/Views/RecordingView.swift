import SwiftUI

struct RecordingView: View {
    @StateObject private var recordingManager = RecordingManager()
    let timeLimit: Int
    
    var body: some View {
        VStack {
            if recordingManager.isRecording {
                Text("Recording...")
                Button("Stop") {
                    recordingManager.stopRecording()
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .clipShape(Circle())
            } else {
                Button("Start Recording") {
                    recordingManager.setupRecorder()
                    recordingManager.startRecording()
                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(timeLimit)) {
                        if recordingManager.isRecording {
                            recordingManager.stopRecording()
                        }
                    }
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                
            }
        }
        .navigationTitle("Record") // Sets the navigation title for this view
    }
}

// Assuming RecordingManager is correctly defined and implements audio recording functionalities.

struct RecordingView_Previews: PreviewProvider {
    static var previews: some View {
        // Wrap RecordingView in a NavigationView for accurate previewing
        NavigationView {
            RecordingView(timeLimit: 100)
        }
    }
}
