//
//  RecordingManager.swift
//  PitchPal
//
//  Created by Sofia Sandoval on 3/21/24.
//

import Foundation
import AVFoundation

class RecordingManager: ObservableObject {
    var audioRecorder: AVAudioRecorder?
    @Published var isRecording = false
    
    func setupRecorder() {
        let recordingSession = AVAudioSession.sharedInstance()
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
        } catch {
            print("Failed to set up recording session")
        }
        
        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let audioFilename = documentPath.appendingPathComponent("recording.m4a")
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder?.prepareToRecord()
        } catch {
            print("Could not start audio recording:", error)
        }
    }
    
    func startRecording() {
        guard let audioRecorder = audioRecorder else { return }
        audioRecorder.record()
        isRecording = true
    }
    
    func stopRecording() {
        audioRecorder?.stop()
        isRecording = false
    }
}
