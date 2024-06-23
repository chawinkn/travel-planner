//
//  swift_projectApp.swift
//  swift-project
//
//  Created by admin on 22/6/2567 BE.
//

import SwiftUI
import SwiftData

@main
struct swift_projectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: TripItem.self)
    }
}
