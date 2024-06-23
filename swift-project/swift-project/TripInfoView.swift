//
//  TripInfoView.swift
//  swift-project
//
//  Created by admin on 22/6/2567 BE.
//

import SwiftUI
import MapKit

struct TripInfoView: View {
    @State var showAddNoteSheet: Bool = false
    @State var showAddLocationSheet: Bool = false
    var item: TripItem
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.red
                    .opacity(0.5)
                    .ignoresSafeArea()
                List {
                    VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                        Text(item.name)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(.bold)
                        Map(
                            initialPosition: MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude),
                                    span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                            ))
                        ) {
                            ForEach(item.locations) { location in
                                Marker(location.name, coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
                            }
                        }
                        .frame(height: 350)
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    
                    Section("Detail") {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Location")
                                    .fontWeight(.bold)
                                Text(item.location)
                            }
                            Spacer()
                        }
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Start date")
                                    .fontWeight(.bold)
                                Text(item.startDate, style: .date)
                            }
                            Spacer()
                        }
                        HStack {
                            VStack(alignment: .leading) {
                                Text("End date")
                                    .fontWeight(.bold)
                                Text(item.endDate, style: .date)
                            }
                            Spacer()
                        }
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Note")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                Text(item.content)
                            }
                        }
                    }
                }
                .padding()
                .listStyle(.plain)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Location") {
                            showAddLocationSheet.toggle()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.white)
                        .foregroundColor(.black)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Edit Note") {
                            showAddNoteSheet.toggle()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.white)
                        .foregroundColor(.black)
                    }
                }
                .sheet(isPresented: $showAddNoteSheet, content: {
                    AddNoteSheet(item: item)
                        .presentationDetents([.medium, .large])
                        .presentationDragIndicator(.visible)
                })
                .sheet(isPresented: $showAddLocationSheet, content: {
                    AddLocationSheet(item: item)
                        .presentationDetents([.medium, .large])
                        .presentationDragIndicator(.visible)
                })
            }
        }
    }
}

//#Preview {
//    TripInfoView()
//}
