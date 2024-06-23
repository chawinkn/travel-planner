//
//  TripItem.swift
//  swift-project
//
//  Created by admin on 22/6/2567 BE.
//

import Foundation
import SwiftData
import MapKit

struct Location: Identifiable, Codable, Hashable {
    var id = UUID().uuidString
    let name: String
    let latitude: Double
    let longitude: Double
}

@Model
class TripItem: Identifiable {
    var id: String
    var name: String
    var startDate: Date
    var endDate: Date
    var isCompleted: Bool
    var latitude: Double
    var longitude: Double
    var location: String
    var locations: [Location]
    var content: String
    
    init(locations: [Location] = []) {
        id = UUID().uuidString
        self.name = ""
        self.startDate = Date.now
        self.endDate = Date.now
        self.isCompleted = false
        self.latitude = 0
        self.longitude = 0
        self.content = ""
        self.location = ""
        self.locations = locations
    }
}
