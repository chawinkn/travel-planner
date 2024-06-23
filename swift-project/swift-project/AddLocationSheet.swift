//
//  AddLocationSheet.swift
//  swift-project
//
//  Created by admin on 23/6/2567 BE.
//

import SwiftUI
import MapKit
import LocationPicker

struct AddLocationSheet: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    var item: TripItem
    @State var locationName: String = ""
    @State private var coordinates = CLLocationCoordinate2D(latitude: 37.333747, longitude: -122.011448)
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                TextField("Location name", text: $locationName)
                Button("Select location") {
                    self.showSheet.toggle()
                }
            }
            .navigationTitle("Add Location")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancle") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        item.locations.append(
                            Location(
                                name: locationName,
                                latitude: coordinates.latitude,
                                longitude: coordinates.longitude
                            )
                        )
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
