//
//  Pitches.swift
//  PitchPal
//
//  Created by Sofia Sandoval on 3/20/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Pitch: Hashable, Codable, Identifiable{
    var id: Int
    var title: String
    var notes: String
    var clarity: Float
    var fluency: Float
    var leadingEmotion: String
    var symbol: String
}
