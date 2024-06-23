//
//  AddTripSheet.swift
//  swift-project
//
//  Created by admin on 22/6/2567 BE.
//

import SwiftUI
import MapKit
import LocationPicker

struct AddTripSheet: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @State var newItem = TripItem()
    @State private var coordinates = CLLocationCoordinate2D(latitude: 37.333747, longitude: -122.011448)
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                TextField("Trip name", text: $newItem.name)
                DatePicker("Start date", selection: $newItem.startDate, displayedComponents: .date)
                DatePicker("End date", selection: $newItem.endDate, displayedComponents: .date)
                TextField("Location name", text: $newItem.location)
                Button("Select location") {
                    self.showSheet.toggle()
                }
            }
            .navigationTitle("Add Trip")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancle") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        newItem.latitude = coordinates.latitude
                        newItem.longitude = coordinates.longitude
                        newItem.locations.append(
                            Location(
                                name: newItem.location,
                                latitude: coordinates.latitude,
                                longitude: coordinates.longitude
                            )
                        )
                        context.insert(newItem)
                        try! context.save()
                        dismiss()
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                LocationPicker(instructions: "Tap to select coordinates", coordinates: $coordinates, dismissOnSelection: true)
            }
        }
    }
}

//#Preview {
//    AddTripSheet()
//}
